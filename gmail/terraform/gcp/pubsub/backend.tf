terraform {
  backend "gcs" {
    bucket = "masatoshi-kouda-terraform-state"
    prefix = "gmail/gcp/pubsub"
  }
}
