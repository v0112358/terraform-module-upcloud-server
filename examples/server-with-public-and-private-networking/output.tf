output "server_vyos_info" {
  value = [
    for server in module.server_vyos[*] :
    server
  ]
}

