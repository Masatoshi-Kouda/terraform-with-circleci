resource "google_pubsub_topic" "example" {
  name = "${var.project}-example-topic"
}

resource "google_pubsub_topic" "example1" {
  name = "${var.project}-example-topic1"
}

resource "google_pubsub_topic" "example2" {
  name = "${var.project}-example-topic2"
}
