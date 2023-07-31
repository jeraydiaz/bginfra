variable "env" {
  description = "Environment name."
  type        = string
}

variable "eks_name" {
  description = "Name of the cluster."
  type        = string
}

#Autoscaler
variable "enable_cluster_autoscaler" {
  description = "Determines whether to deploy cluster autoscaler"
  type        = bool
  default     = false
}

variable "cluster_autoscaler_helm_version" {
  description = "Cluster Autoscaler Helm version"
  type        = string
  default     = "9.28.0"
}

variable "openid_provider_arn" {
  description = "IAM Openid Connect Provider ARN"
  type        = string
}

#Ambassador

variable "ambassador_manifest_version" {
  description = "Version of the CRDs to install"
  type        = string
  default     = null
}

variable "ambassador_yaml_manifest" {
  description = "Override the YAML manifest instead of the one from the usual URL"
  type        = string
  default     = null
}

variable "image_replace" {
  description = "Replace the Docker image"
  type        = string
  default     = null
}

#ArgoCD
variable "enable_argocd" {
  description = "Determines whether to deploy argocd"
  type        = bool
  default     = false
}

variable "argocd_chart_version" {
  description = "Version of ArgoCD chart to install"
  type        = string
  default     = "5.36.14" # See https://artifacthub.io/packages/helm/argo/argo-cd for latest version(s)
}

variable "argocd_admin_password" {
  description = "Default Admin Password"
  type        = string
  default     = "admin"
}

variable "argocd_values_file" {
  description = "The name of the ArgoCD helm chart values file to use"
  type        = string
  default     = "values.yaml"
}

#ArgoCD image updater

variable "enable_argocdimageupdater" {
  description = "Determines whether to deploy argocdimageupdater"
  type        = bool
  default     = false
}

variable "argocdimageupdater_chart_version" {
  description = "Version of ArgoCD image updater chart to install"
  type        = string
  default     = "0.8.4" # See https://artifacthub.io/packages/helm/argo/argocd-image-updater for latest version(s)
}

variable "argocdimageupdater_values_file" {
  description = "The name of the ArgoCD image updater helm chart values file to use"
  type        = string
  default     = "values.yaml"
}
