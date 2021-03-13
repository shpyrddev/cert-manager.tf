
data "kustomization_overlay" "certmanager" {
  resources = [
    "${path.module}/upstream"
  ]
}