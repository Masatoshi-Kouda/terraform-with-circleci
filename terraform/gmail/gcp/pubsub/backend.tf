terraform {
  backend "gcs" {
    bucket = "masatoshi-kouda-terraform-state"
    prefix = "gcp/pubsub"
  }
}
