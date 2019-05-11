provider "google" {
  project = "${var.project_id}"
  region  = "${local.region}"
}
