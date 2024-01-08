terraform {
  backend "gcs" {
    bucket = "soofs-infra-state"
    prefix = "soofs-infra/edgedb-backing-db"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.7.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

provider "google" {
  project = "soofs-infra"
  region  = "us-central1"
  zone    = "us-central1-c"
}