terraform {
  backend "gcs" {
    bucket = "masatoshi-kouda-terraform-state"
    prefix = "youtube/gcp/pubsub"
  }
}
