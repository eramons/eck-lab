resource "helm_release" "cert_manager" {
  name       = "cert-manager"
  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  namespace  = "cert-manager"
  create_namespace = true
  version = "1.15"
  set {
    name = "crds.enabled"
    value = "true"
  }
  set {
    name = "config.apiVersion"
    value = "controller.config.cert-manager.io/v1alpha1"
  }
  set {
    name = "config.kind"
    value = "ControllerConfiguration"
  }
  set {
    name = "config.enableGatewayAPI"
    value = true
  }
}

resource "helm_release" "ingress_nginx" {
  count = var.controller_type == "ingress" ? 1 : 0
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

resource "helm_release" "gateway_api_controller" {
  count = var.controller_type == "gatewayapi" ? 1 : 0
  name       = "gateway-api"
  chart      = "gateway-api/chart"
  namespace  = "nginx-gateway"
  create_namespace = true
  set {
    name  = "controller.service.loadBalancerIP"
    value = var.ingress_ip
  }
  set {
    name  = "installCRDs"
    value = true
  }
}

resource "helm_release" "kube_state_metrics" {
  name       = "kube-state-metrics"
  namespace  = "kube-system"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-state-metrics"
}

# ArgoCD deployment disabled in the blog version

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
