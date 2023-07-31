resource "helm_release" "argocd" {
  count = var.enable_argocd ? 1 : 0
  namespace        = "argo-cd"
  create_namespace = true
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  version          = var.argocd_chart_version

  # Helm chart deployment can sometimes take longer than the default 5 minutes
  timeout = 800

  # If values file specified by the var.values_file input variable exists then apply the values from this file
  # else apply the default values from the chart
  values = [fileexists("${path.root}/${var.argocd_values_file}") == true ? file("${path.root}/${var.argocd_values_file}") : ""]

  set_sensitive {
    name  = "configs.secret.argocdServerAdminPassword"
    value = var.argocd_admin_password == "" ? "" : bcrypt(var.argocd_admin_password)
  }

  set {
    name  = "configs.params.server.insecure"
    value = false
  }

  set {
    name  = "dex.enabled"
    value = true
  }
}