package amqp

import (
	"time"

	"github.com/cenkalti/backoff/v4"
	amqp "github.com/rabbitmq/amqp091-go"
	"github.com/spiral/errors"
	"github.com/spiral/roadrunner/v2/pkg/events"
	"github.com/spiral/roadrunner/v2/plugins/jobs/pipeline"
)

// redialer used to redial to the rabbitmq in case of the connection interrupts
func (j *JobConsumer) redialer() { //nolint:gocognit
	go func() {
		const op = errors.Op("rabbitmq_redial")

		for {
			select {
			case err := <-j.conn.NotifyClose(make(chan *amqp.Error)):
				if err == nil {
					return
				}

				j.Lock()

				// trash the broken publishing channel
				<-j.publishChan

				t := time.Now()
				pipe := j.pipeline.Load().(*pipeline.Pipeline)

				j.eh.Push(events.JobEvent{
					Event:    events.EventPipeError,
					Pipeline: pipe.Name(),
					Driver:   pipe.Driver(),
					Error:    err,
					Start:    time.Now(),
				})

				expb := backoff.NewExponentialBackOff()
				// set the retry timeout (minutes)
				expb.MaxElapsedTime = j.retryTimeout
				operation := func() error {
					j.log.Warn("rabbitmq reconnecting, caused by", "error", err)
					var dialErr error
					j.conn, dialErr = amqp.Dial(j.connStr)
					if dialErr != nil {
						return errors.E(op, dialErr)
					}

					j.log.Info("rabbitmq dial succeed. trying to redeclare queues and subscribers")

					// re-init connection
					errInit := j.initRabbitMQ()
					if errInit != nil {
						j.log.Error("rabbitmq dial", "error", errInit)
						return errInit
					}

					// redeclare consume channel
					var errConnCh error
					j.consumeChan, errConnCh = j.conn.Channel()
					if errConnCh != nil {
						return errors.E(op, errConnCh)
					}

					// redeclare publish channel
					pch, errPubCh := j.conn.Channel()
					if errPubCh != nil {
						return errors.E(op, errPubCh)
					}

					// start reading messages from the channel
					deliv, err := j.consumeChan.Consume(
						j.queue,
						j.consumeID,
						false,
						false,
						false,
						false,
						nil,
					)
					if err != nil {
						return errors.E(op, err)
					}

					// put the fresh publishing channel
					j.publishChan <- pch
					// restart listener
					j.listener(deliv)

					j.log.Info("queues and subscribers redeclared successfully")

					return nil
				}

				retryErr := backoff.Retry(operation, expb)
				if retryErr != nil {
					j.Unlock()
					j.log.Error("backoff failed", "error", retryErr)
					return
				}

				j.eh.Push(events.JobEvent{
					Event:    events.EventPipeActive,
					Pipeline: pipe.Name(),
					Driver:   pipe.Driver(),
					Start:    t,
					Elapsed:  time.Since(t),
				})

				j.Unlock()

			case <-j.stopCh:
				if j.publishChan != nil {
					pch := <-j.publishChan
					err := pch.Close()
					if err != nil {
						j.log.Error("publish channel close", "error", err)
					}
				}

				if j.consumeChan != nil {
					err := j.consumeChan.Close()
					if err != nil {
						j.log.Error("consume channel close", "error", err)
					}
				}
				if j.conn != nil {
					err := j.conn.Close()
					if err != nil {
						j.log.Error("amqp connection close", "error", err)
					}
				}

				return
			}
		}
	}()
}