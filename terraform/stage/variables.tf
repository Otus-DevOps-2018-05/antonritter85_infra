variable project {
  description = "Project ID"
}

variable region {
  description = "Region"
  default     = "europe-west1"
}

variable zone {
  description = "Zone"
  default     = "europe-west1-b"
}

variable app_machine_type {
  description = "Type of  virtual machine instance for app"
  default     = "g1-small"
}

variable db_machine_type {
  description = "Type of  virtual machine instance for db"
  default     = "g1-small"
}

variable public_key_path {
  description = "Path to the public key used for ssh access"
}

variable private_key_path {
  description = "Path to the private key used for ssh access"
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}

variable db_disk_image {
  description = "Disk image for reddit DB"
  default     = "reddit-db-base"
}

variable reddit_db_ip {
  description = "Internal IP address of reddit-db instance"
  default     = "0.0.0.0"
}

variable provisioners_enabled {
  description = "Provisoners toggle"
  default     = true
}

variable reddit_app_tags {
  description = "Tags for firewall rules of reddit app instance"

  default = [
    "reddit-app",
  ]
}
