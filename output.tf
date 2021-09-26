locals {
  server_zone                 = compact(concat(upcloud_server.server[*].zone, list("")))
  server_id                   = compact(concat(upcloud_server.server[*].id, list("")))
  server_hostname             = compact(concat(upcloud_server.server[*].hostname, list("")))
  server_size                 = compact(concat(upcloud_server.server[*].plan, list("")))
  floating_ip_address         = compact(concat(upcloud_floating_ip_address.floating_ip_address[*].ip_address, list("")))
  server_ipv4_address_public  = upcloud_server.server[*].network_interface[0].type == "public" ? compact(concat(upcloud_server.server[*].network_interface[0].ip_address, list(""))) : list("")
  server_ipv4_address_private = upcloud_server.server[*].network_interface[0].type == "private" ? compact(concat(upcloud_server.server[*].network_interface[0].ip_address, list(""))) : compact(concat(upcloud_server.server[*].network_interface[1].ip_address, list("")))
}

output "zone" {
  description = "List of zone of server"
  value       = local.server_zone
}

output "server_id" {
  description = "List of IDs of server"
  value       = local.server_id
}

output "server_hostname" {
  description = "List hostname of server"
  value       = local.server_hostname
}

output "plan" {
  description = "List of plan of server"
  value       = local.server_size
}

output "floating_ip_address" {
  description = "List of floating IP addresses was created"
  value       = local.floating_ip_address
}

output "ipv4_address_public" {
  description = "List of public IPv4 addresses assigned to the server"
  value       = local.server_ipv4_address_public
}

output "ipv4_address_private" {
  description = "List of private IPv4 addresses assigned to the server"
  value       = local.server_ipv4_address_private
}
