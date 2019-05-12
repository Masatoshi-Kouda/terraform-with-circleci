/**
resource "google_storage_bucket" "example" {
  name          = "${var.project}-${local.location}-example-storage"
  location      = "${local.region}"
  storage_class = "REGIONAL"

  labels {
    project = "${var.project}"
  }

  force_destroy = true
}
**/

