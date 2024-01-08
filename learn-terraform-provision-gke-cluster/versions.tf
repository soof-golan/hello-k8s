# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

terraform {
  backend "gcs" {
    bucket = "soofs-infra-state"
    prefix = "soofs-infra/terraform/state"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.5.0"
    }
  }

  required_version = ">= 0.14"
}

