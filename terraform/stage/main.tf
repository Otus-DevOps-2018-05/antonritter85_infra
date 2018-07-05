provider "google" {
  version = "1.4.0"
  project = "${var.project}"
  region  = "${var.region}"
}

module "app" {
  source               = "../modules/app"
  public_key_path      = "${var.public_key_path}"
  private_key_path     = "${var.private_key_path}"
  zone                 = "${var.zone}"
  machine_type         = "${var.app_machine_type}"
  app_disk_image       = "${var.app_disk_image}"
  reddit_db_ip         = "${module.db.db_internal_ip}"
  provisioners_enabled = "${var.provisioners_enabled}"
}

module "db" {
  source               = "../modules/db"
  public_key_path      = "${var.public_key_path}"
  private_key_path     = "${var.private_key_path}"
  zone                 = "${var.zone}"
  machine_type         = "${var.db_machine_type}"
  db_disk_image        = "${var.db_disk_image}"
  provisioners_enabled = "${var.provisioners_enabled}"
}

module "vpc" {
  source        = "../modules/vpc"
  source_ranges = ["0.0.0.0/0"]
}
