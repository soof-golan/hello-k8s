resource "random_password" "root_sql_password" {
  length = 20
}

resource "random_id" "db_name_suffix" {
  byte_length = 4
}

data "terraform_remote_state" "base" {
  backend = "gcs"
  config  = {
    bucket = "soofs-infra-state"
    prefix = "soofs-infra/terraform/state"
  }
}

data "google_compute_network" "cluster_vpc" {
  name = data.terraform_remote_state.base.outputs.kubernetes_cluster_vpc.name
}



resource "google_sql_database_instance" "default" {
  name                = "cloud-sql-poc-${random_id.db_name_suffix.hex}"
  database_version    = "POSTGRES_14"
  count               = 1
  deletion_protection = false

  settings {
    tier              = "db-f1-micro"
    availability_type = "ZONAL"
    disk_size         = 10
    disk_type         = "PD_HDD"


    ip_configuration {
      ipv4_enabled                                  = false
      enable_private_path_for_google_cloud_services = true
      private_network                               = data.google_compute_network.cluster_vpc.id
    }

  }

  root_password = random_password.root_sql_password.result
}


resource "google_sql_database" "default" {
  name     = "defaultdb"
  instance = google_sql_database_instance.default[0].name
}

