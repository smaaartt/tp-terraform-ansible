variable "container_name" {
  description = "Nom du container"
  type        = string
  default     = "mon_serveur_web"
}

variable "image_name" {
  description = "Image Docker à utiliser"
  type        = string
  default     = "nginx:latest"
}

variable "external_port" {
  description = "Port exposé sur la machine hôte"
  type        = number
  default     = 8080
}

variable "environment" {
  description = "Nom de l'environnement (ex: dev, prod)"
  type        = string
  default     = "dev"
}