require "opentelemetry/sdk"
require "opentelemetry/instrumentation/all"

ENV["OTEL_TRACES_EXPORTER"] = "jaeger"

OpenTelemetry::SDK.configure do |c|
  c.use_all()
  c.service_name = "weather API"
end
