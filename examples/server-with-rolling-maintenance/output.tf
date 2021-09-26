output "server_mongodb_info" {
  value = [
    for server in module.server_mongodb[*] :
    server
  ]
}

