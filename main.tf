variable "project_name" {}
variable "region" {}
variable "credentials" {}

provider "google" {
 region = "${var.region}"
 credentials = "${var.credentials}"
}


resource "google_compute_instance" "default" {
 project = "${var.project_name}"
 zone = "us-central1-a"
 name = "tf-compute-1"
 machine_type = "f1-micro"
 boot_disk {
    initialize_params {
      image = "debian-cloud/debian-8"
    }
  }
 network_interface {
   network = "default"
   access_config {
   }
 }
}
 
output "instance_id" {
 value = "${google_compute_instance.default.self_link}"
}
