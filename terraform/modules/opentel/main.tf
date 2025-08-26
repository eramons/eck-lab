resource "helm_release" "opentelemetry_demo" {
  name       = "my-otel-demo"
  repository = "https://open-telemetry.github.io/opentelemetry-helm-charts"
  # Pin to chart version 0.35.1 which features demo version 1.12.0, last one using Elastic APM server 
  version    = "0.35.1"
  chart      = "opentelemetry-demo"
  namespace  = "default"

  # Use the custom values.yaml file
  values = [file("${path.module}/deployment.yaml")]

 # Newer versions of the Elastic fork of the OTEL Demo use EDOT Otel Collector instead of APM server and "demo.yaml" instead of "deployment.yaml" as values file
}
