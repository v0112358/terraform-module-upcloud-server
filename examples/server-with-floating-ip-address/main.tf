terraform {
  required_providers {
    upcloud = {
      source  = "UpCloudLtd/upcloud"
      version = "~> 2.1.1"
    }
  }
  required_version = ">= 0.13"
}

provider "upcloud" {
  username = "<Your username>"
  password = "<Your password>"
}

resource "upcloud_network" "upcloud_network_internal" {
  name = "internal_network"
  zone = "sg-sin1"

  ip_network {
    address            = "172.16.16.0/24"
    dhcp               = true
    dhcp_default_route = false
    family             = "IPv4"
  }
}

module "server_nginx" {
  source         = "../../"
  zone           = "sg-sin1"
  server_count   = 2
  server_name    = "vm-dev-infra-nginx"
  server_size    = "1xCPU-1GB"
  root_disk_size = 25
  tags           = ["web", "nginx"]
  user_data      = file("user-data.nginx")
  ssh_keys       = split("\n", chomp(file("ssh-keys.sre")))

  public_networking  = true
  private_networking = true
  private_subnet     = upcloud_network.upcloud_network_internal.id

  floating_ip       = true
  floating_ip_count = 1
}
