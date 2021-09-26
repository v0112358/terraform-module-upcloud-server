output "server_redis_info" {
  value = [
    for server in module.server_redis[*] :
    server
  ]
}

