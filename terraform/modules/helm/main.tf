resource "helm_release" "ingress_nginx" {
  name       = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  namespace  = "ingress-nginx"
  create_namespace = true

  # Pinning to ingress-controller v1.10.1 (default by chart 4.10.1) to avoid breaking changes
  version    = "4.10.1"
  set {
    name  = "controller.service.loadBalancerIP"
    value = var.ingress_ip
  }
}

resource "helm_release" "cert_manager" {
  name       = "cert-manager"
  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  namespace  = "cert-manager"
  create_namespace = true

  # Pinning to version 1.13.3 to avoid breaking changes
  version    = "1.13.3"
  set {
    name  = "installCRDs"
    value = "true"
  }
}

resource "helm_release" "kube_state_metrics" {
  name       = "kube-state-metrics"
  namespace  = "kube-system"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-state-metrics"
}

resource "helm_release" "argocd" {
  name       = "argocd"
  namespace  = "argocd"
  create_namespace = true

  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "5.51.6" 

  values = [
    file("${path.module}/values/argocd.yaml")
  ]
}
