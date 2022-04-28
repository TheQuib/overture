resource "harvester_image" "ubuntu20" {
  name      = "ubuntu20"
  namespace = "homelab"

  display_name = "ubuntu20"
  source_type  = "download"
  url          = "http://cloud-images.ubuntu.com/releases/focal/release/ubuntu-20.04-server-cloudimg-amd64.img"
}