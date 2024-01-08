resource "google_project_service" "sqladmin_api" {
  service = "sqladmin.googleapis.com"
}

resource "google_project_service" "compute_api" {
  service = "compute.googleapis.com"
}

resource "google_project_service" "gke_api" {
  service = "container.googleapis.com"
}
