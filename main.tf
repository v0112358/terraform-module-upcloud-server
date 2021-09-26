// Create server
resource "upcloud_server" "server" {
  count    = var.server_count
  hostname = format("%s-%s", var.server_name, count.index)
  zone     = var.zone
  plan     = var.rolling_maintenance.enable == true && contains(var.rolling_maintenance.server_index, count.index) ? var.rolling_maintenance.resize_plan : var.server_size
  metadata = var.metadata
  firewall = var.firewall
  dynamic "network_interface" {
    for_each = toset(var.public_networking == true ? ["fake"] : [])
    content {
      type = "public"
    }
  }

  dynamic "network_interface" {
    for_each = toset(var.private_networking == true ? ["fake"] : [])
    content {
      type                = "private"
      source_ip_filtering = false
      network             = var.private_subnet
    }
  }

  login {
    user            = "root"
    keys            = var.ssh_keys
    create_password = var.set_password
  }

  template {
    storage = coalesce(var.image_id, var.server_os)
    size    = var.root_disk_size
  }

  tags = var.tags

  user_data = var.user_data
}

// Create floating ip address
resource "upcloud_floating_ip_address" "floating_ip_address" {
  depends_on  = [upcloud_server.server]
  count       = var.floating_ip == true && var.server_count > 0 ? coalesce(var.floating_ip_count, var.server_count) : 0
  mac_address = element(upcloud_server.server[*].network_interface[0].mac_address, count.index)
  zone        = var.zone
}
