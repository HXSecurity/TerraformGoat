provider "google" {
  region  = "us-central1"
  project = var.gcp_project_id
}

resource "google_storage_bucket" "bucket" {
  name          = "hx-cloud-security-${random_string.random_suffix.result}"
  location      = "US"
  force_destroy = true
}

resource "google_storage_bucket_access_control" "public_rule" {
  bucket = google_storage_bucket.bucket.name
  role   = "OWNER"
  entity = "allUsers"
  depends_on = [
    google_storage_bucket.bucket
  ]
}


resource "google_storage_default_object_acl" "image-store-default-acl" {
  bucket = google_storage_bucket.bucket.name
  role_entity = [
    "READER:allUsers",
  ]
}

resource "random_string" "random_suffix" {
  length  = 5
  special = false
  upper   = false
}