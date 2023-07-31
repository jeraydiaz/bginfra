resource "helm_release" "argocd-image-updater" {
  count = var.enable_argocdimageupdater ? 1 : 0
  namespace        = "argo-cd"
  create_namespace = true
  name             = "argocd-image-updater"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argocd-image-updater"
  version          = var.argocdimageupdater_chart_version

  # Helm chart deployment can sometimes take longer than the default 5 minutes
  timeout = 800

  # If values file specified by the var.values_file input variable exists then apply the values from this file
  # else apply the default values from the chart
  values = [fileexists("${path.root}/${var.argocdimageupdater_values_file}") == true ? file("${path.root}/${var.argocdimageupdater_values_file}") : ""]

  set {
    name  = "metrics.enabled"
    value = true
  }
}