variable zone {
  description = "Zone"
  default     = "europe-west1-b"
}

variable machine_type {
  description = "Type of virtual machine instance for db"
  default     = "g1-small"
}

variable public_key_path {
  description = "Path to the public key used for ssh access"
}

variable private_key_path {
  description = "Path to the private key used for ssh access"
}

variable db_disk_image {
  description = "Disk image for reddit DB"
  default     = "reddit-db-base"
}
