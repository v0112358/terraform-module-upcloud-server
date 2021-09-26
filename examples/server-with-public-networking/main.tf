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

module "server_nginx" {
  source         = "../../"
  zone           = "sg-sin1"
  server_count   = 1
  server_name    = "vm-dev-infra-nginx"
  server_size    = "1xCPU-1GB"
  root_disk_size = 25
  tags           = ["nginx", "web"]
  user_data      = file("user-data.nginx")
  ssh_keys       = split("\n", chomp(file("ssh-keys.sre")))
}
