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
