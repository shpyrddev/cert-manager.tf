
output "initial_resource_ids" {
  value = data.kustomization_overlay.certmanager.ids_prio[0]
}

output "standard_resource_ids" {
  value = data.kustomization_overlay.certmanager.ids_prio[1]

}

output "webhook_resource_ids" {
  value = data.kustomization_overlay.certmanager.ids_prio[2]
}