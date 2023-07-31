data "http" "this" {
  count = var.ambassador_yaml_manifest == null ? 1 : 0

  url = "https://app.getambassador.io/yaml/emissary/${var.ambassador_manifest_version}/emissary-crds.yaml"
}

locals {
  manifest = coalesce(var.ambassador_yaml_manifest, data.http.this[0].response_body)
}

data "kubectl_file_documents" "this" {
  content = var.image_replace != null ? replace(local.manifest, "image: docker.io/emissaryingress/emissary", "image: ${var.image_replace}") : local.manifest
}

resource "kubectl_manifest" "this" {
  for_each = data.kubectl_file_documents.this.manifests

  yaml_body = each.value
}