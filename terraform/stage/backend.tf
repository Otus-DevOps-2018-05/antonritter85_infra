terraform {
  backend "gcs" {
    bucket = "ar85-tf-state-stage"
    prefix = "terraform/state"
  }
}
