## Terraform Resources

The terraform configuration examples provide an optional way to deploy the Google Cloud Platform (GCP) infrastructure to support a Kubernetes-based demo environment.

The terraform modules included are:
- [**GKE**](modules/gke/): Provisions the [Google Kubernetes Engine (GKE)](https://cloud.google.com/kubernetes-engine) cluster and associated resources.
- [**Helm**](modules/helm/): Deploys essential Kubernetes utilities using Helm charts.
- [**Opentelemetry**](modules/opentel/): Deploy the [opentelemetry demo application](https://github.com/open-telemetry/opentelemetry-demo)
- [**Ollama**](modules/ollama/): Deploys a virtual machine on GCP and installs Ollama for self-hosted LLMs.

