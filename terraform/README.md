## Terraform Resources

The terraform configuration examples provide an optional way to deploy the Google Cloud Platform (GCP) infrastructure to support a Kubernetes-based demo environment.

The terraform modules included are:
- [**GKE**](modules/gke/README.md): Provisions the [Google Kubernetes Engine (GKE)](https://cloud.google.com/kubernetes-engine) cluster and associated resources.
- [**Helm**](modules/helm/README.md): Deploys essential Kubernetes utilities using Helm charts.
- **Opentelemetry**: *(Coming soon)*
- **Ollama**: *(Coming soon)*
