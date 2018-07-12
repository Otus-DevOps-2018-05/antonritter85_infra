resource "google_compute_http_health_check" "default" {
  name               = "default"
  request_path       = "/"
  port               = "9292"
  check_interval_sec = 5
  timeout_sec        = 5
}

resource "google_compute_target_pool" "default" {
  name = "instance-pool"

  instances = [
    "${google_compute_instance.app.*.self_link}",
  ]

  health_checks = [
    "${google_compute_http_health_check.default.name}",
  ]
}

resource "google_compute_forwarding_rule" "default" {
  name       = "default-rule"
  port_range = "9292"
  target     = "${google_compute_target_pool.default.self_link}"
}
