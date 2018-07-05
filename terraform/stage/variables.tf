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
  default     = "f1-micro"
}

variable db_machine_type {
  description = "Type of  virtual machine instance for db"
  default     = "f1-micro"
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
