resource "helm_release" "ingress_nginx" {
  name       = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  namespace  = "ingress-nginx"
  create_namespace = true

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

  # This flag is throwing a deprecation warning, however there is no alternative yet
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

# ArgoCD deployment disabled in this blog version

# resource "helm_release" "argocd" {
#   name       = "argocd"
#   namespace  = "argocd"
#   create_namespace = true
# 
#   repository = "https://argoproj.github.io/argo-helm"
#   chart      = "argo-cd"
#   version    = "5.51.6" 
# 
#   values = [
#     file("${path.module}/values/argocd.yaml")
#   ]
# }
