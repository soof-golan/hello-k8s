terraform {
  backend "gcs" {
    bucket = "soofs-infra-state"
    prefix = "soofs-infra/nginx/terraform/state"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.74.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.1"
    }
  }
}
