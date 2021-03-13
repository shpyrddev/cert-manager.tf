resource "kubernetes_namespace" "certmanager" {
  metadata {
    name = var.namespace
  }
}

resource "kustomization_resource" "p0" {
  for_each = var.apply_manifests ? data.kustomization_overlay.certmanager.ids_prio[0] : []

  manifest = data.kustomization_overlay.certmanager.manifests[each.value]

  depends_on = [kubernetes_namespace.certmanager]
}

resource "kustomization_resource" "p1" {
  for_each = var.apply_manifests ? data.kustomization_overlay.certmanager.ids_prio[1] : []

  manifest = data.kustomization_overlay.certmanager.manifests[each.value]

  depends_on = [kustomization_resource.p0]
}

resource "kustomization_resource" "p2" {
  for_each = var.apply_manifests ? data.kustomization_overlay.certmanager.ids_prio[2] : []

  manifest = data.kustomization_overlay.certmanager.manifests[each.value]

  depends_on = [kustomization_resource.p1]
}