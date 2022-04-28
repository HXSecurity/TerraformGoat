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
  role   = "READER"
  entity = "allUsers"
  depends_on = [
    google_storage_bucket.bucket
  ]
}

resource "google_storage_bucket_object" "object" {
  name   = "flag1650859"
  source = "flag1650859"
  bucket = google_storage_bucket.bucket.name
  depends_on = [
    google_storage_bucket.bucket
  ]
}

resource "google_storage_object_access_control" "public_rule" {
  object = google_storage_bucket_object.object.output_name
  bucket = google_storage_bucket.bucket.name
  role   = "READER"
  entity = "allUsers"
  depends_on = [
    google_storage_bucket_object.object
  ]
}

resource "random_string" "random_suffix" {
  length  = 5
  special = false
  upper   = false
}