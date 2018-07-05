resource "google_compute_instance" "db" {
  name         = "reddit-db"
  machine_type = "${var.machine_type}"
  zone         = "${var.zone}"

  boot_disk {
    initialize_params {
      image = "${var.db_disk_image}"
    }
  }

  metadata {
    ssh-keys = "appuser:${file(var.public_key_path)}"
  }

  tags = ["reddit-db"]

  network_interface {
    network       = "default"
    access_config = {}
  }
}

resource "null_resource" "app" {
  count = "${var.provisioners_enabled}"

  connection {
    type        = "ssh"
    host        = "${google_compute_instance.db.network_interface.0.access_config.0.assigned_nat_ip}"
    user        = "appuser"
    agent       = "false"
    private_key = "${file(var.private_key_path)}"
  }

  provisioner "file" {
    source      = "${path.module}/files/mongod.conf"
    destination = "/tmp/mongod.conf"
  }

  provisioner "remote-exec" {
    script = "${path.module}/files/mongo_conf.sh"
  }
}

resource "google_compute_firewall" "firewall-mongo" {
  name = "allow-mongo-default"

  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["27017"]
  }

  source_ranges = ["0.0.0.0/0"]

  # правило применимо к инстансам с тегом ...
  target_tags = ["reddit-db"]

  # порт будет доступен только для инстансов с тегом ...
  source_tags = ["reddit-app"]
}
