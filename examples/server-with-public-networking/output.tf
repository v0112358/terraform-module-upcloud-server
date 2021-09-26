output "server_nginx_info" {
  value = [
    for server in module.server_nginx[*] :
    server
  ]
}

