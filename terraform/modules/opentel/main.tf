resource "helm_release" "opentelemetry_demo" {
  name       = "my-otel-demo"
  repository = "https://open-telemetry.github.io/opentelemetry-helm-charts"
  chart      = "opentelemetry-demo"
  namespace  = "default"

  # Use the custom values.yaml file
  values = [file("${path.module}/deployment.yaml")]
}
