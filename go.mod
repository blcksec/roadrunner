module github.com/blcksec/roadrunner/v2

go 1.19

require (
	github.com/buger/goterm v1.0.4
	github.com/darkweak/souin/plugins/roadrunner v0.0.0-20221024182059-f3669a8ebe3d
	github.com/dustin/go-humanize v1.0.0
	github.com/fatih/color v1.13.0
	github.com/joho/godotenv v1.4.0
	github.com/olekukonko/tablewriter v0.0.5
	github.com/roadrunner-server/amqp/v3 v3.0.0-beta.2
	github.com/roadrunner-server/beanstalk/v3 v3.0.0-beta.2
	github.com/roadrunner-server/boltdb/v3 v3.0.0-beta.1
	github.com/roadrunner-server/centrifuge/v3 v3.0.0-alpha.3
	github.com/roadrunner-server/config/v3 v3.0.0-beta.1
	github.com/roadrunner-server/endure v1.4.5
	github.com/roadrunner-server/errors v1.2.0
	github.com/roadrunner-server/fileserver/v3 v3.0.0-beta.2
	github.com/roadrunner-server/goridge/v3 v3.6.1
	github.com/roadrunner-server/grpc/v3 v3.0.0-beta.1
	github.com/roadrunner-server/gzip/v3 v3.0.0-beta.1
	github.com/roadrunner-server/headers/v3 v3.0.0-beta.3
	github.com/roadrunner-server/http/v3 v3.0.0-beta.2
	github.com/roadrunner-server/informer/v3 v3.0.0-beta.1
	github.com/roadrunner-server/jobs/v3 v3.0.0-beta.2
	github.com/roadrunner-server/kafka/v3 v3.0.0-beta.1
	github.com/roadrunner-server/kv/v3 v3.0.0-beta.1
	github.com/roadrunner-server/logger/v3 v3.0.0-beta.1
	github.com/roadrunner-server/memcached/v3 v3.0.0-beta.1
	github.com/roadrunner-server/memory/v3 v3.0.0-beta.2
	github.com/roadrunner-server/metrics/v3 v3.0.0-beta.1
	github.com/roadrunner-server/nats/v3 v3.0.0-beta.1
	github.com/roadrunner-server/otel/v3 v3.0.0-beta.1
	github.com/roadrunner-server/prometheus/v3 v3.0.0-beta.1
	github.com/roadrunner-server/proxy_ip_parser/v3 v3.0.0-beta.1
	github.com/roadrunner-server/redis/v3 v3.0.0-beta.2
	github.com/roadrunner-server/reload/v3 v3.0.0-beta.1
	github.com/roadrunner-server/resetter/v3 v3.0.0-beta.1
	github.com/roadrunner-server/rpc/v3 v3.0.0-beta.1
	github.com/roadrunner-server/sdk/v3 v3.0.0-beta.4
	github.com/roadrunner-server/send/v3 v3.0.0-beta.1
	github.com/roadrunner-server/server/v3 v3.0.0-beta.4
	github.com/roadrunner-server/service/v3 v3.0.0-beta.1
	github.com/roadrunner-server/sqs/v3 v3.0.0-beta.1
	github.com/roadrunner-server/static/v3 v3.0.0-beta.1
	github.com/roadrunner-server/status/v3 v3.0.0-beta.1
	github.com/roadrunner-server/tcp/v3 v3.0.0-beta.1
	github.com/spf13/cobra v1.6.1
	github.com/spf13/viper v1.13.0
	github.com/stretchr/testify v1.8.1
	github.com/temporalio/roadrunner-temporal/v2 v2.0.0-beta.3
	go.buf.build/protocolbuffers/go/roadrunner-server/api v1.3.20
)

require (
	github.com/armon/go-metrics v0.4.1 // indirect
	github.com/aws/aws-sdk-go-v2/config v1.17.10 // indirect
	github.com/aws/aws-sdk-go-v2/service/sqs v1.19.12 // indirect
	github.com/buraksezer/consistent v0.9.0 // indirect
	github.com/buraksezer/olric v0.4.8 // indirect
	github.com/coreos/go-systemd/v22 v22.4.0 // indirect
	github.com/dgraph-io/badger/v3 v3.2103.3 // indirect
	github.com/go-redis/redis/v9 v9.0.0-rc.1 // indirect
	github.com/gofiber/fiber/v2 v2.39.0 // indirect
	github.com/google/btree v1.1.2 // indirect
	github.com/google/flatbuffers v22.10.26+incompatible // indirect
	github.com/grpc-ecosystem/grpc-gateway/v2 v2.12.0 // indirect
	github.com/hashicorp/go-msgpack v1.1.5 // indirect
	github.com/hashicorp/memberlist v0.5.0 // indirect
	github.com/klauspost/compress v1.15.12 // indirect
	github.com/matttproud/golang_protobuf_extensions v1.0.4 // indirect
	github.com/nats-io/jwt/v2 v2.3.0 // indirect
	github.com/nats-io/nats.go v1.18.0 // indirect
	github.com/prometheus/client_model v0.3.0 // indirect
	github.com/rivo/uniseg v0.4.2 // indirect
	github.com/valyala/fasthttp v1.41.0 // indirect
	github.com/xujiajun/nutsdb v0.10.0 // indirect
	github.com/xujiajun/utils v0.0.0-20220904132955-5f7c5b914235 // indirect
	go.etcd.io/etcd/client/v3 v3.5.5 // indirect
	go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp v0.36.4 // indirect
	go.opentelemetry.io/contrib/propagators/jaeger v1.11.1 // indirect
	go.opentelemetry.io/otel/exporters/jaeger v1.11.1 // indirect
	go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracegrpc v1.11.1 // indirect
	go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracehttp v1.11.1 // indirect
	go.opentelemetry.io/otel/exporters/stdout/stdouttrace v1.11.1 // indirect
	go.opentelemetry.io/otel/exporters/zipkin v1.11.1 // indirect
	go.temporal.io/server v1.18.3 // indirect
	golang.org/x/time v0.1.0 // indirect
	golang.org/x/tools v0.2.0 // indirect
	google.golang.org/genproto v0.0.0-20221025140454-527a21cfbd71 // indirect
)
