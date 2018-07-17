terraform {
  backend "gcs" {
    bucket = "ar85-tf-state-prod"
    prefix = "terraform/state"
  }
}
