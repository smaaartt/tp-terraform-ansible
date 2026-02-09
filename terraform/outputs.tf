output "container_id" {
  value = docker_container.app_container.id
}

output "container_name" {
  value = docker_container.app_container.name
}

output "service_url" {
  value = "http://localhost:${var.external_port}"
}