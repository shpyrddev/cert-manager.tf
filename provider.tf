terraform {
  required_providers {
    kustomization = {
      source = "kbst/kustomization"
      version = "0.4.2"
    }
  }
}

provider "kustomization" {
  # Configuration options
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "kind-kind"
}