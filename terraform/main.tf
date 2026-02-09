# 1. Création du réseau Docker dédié
resource "docker_network" "private_network" {
  name = "${var.container_name}_net"
}

# 2. Création du volume Docker pour la persistance
resource "docker_volume" "shared_data" {
  name = "${var.container_name}_data"
}

# 3. Gestion de l'image (téléchargement)
resource "docker_image" "app_image" {
  name         = var.image_name
  keep_locally = true
}

# 4. Création du container
resource "docker_container" "app_container" {
  name  = var.container_name
  image = docker_image.app_image.image_id

  # Mapping du réseau
  networks_advanced {
    name = docker_network.private_network.name
  }

  # Mapping du volume
  volumes {
    volume_name    = docker_volume.shared_data.name
    container_path = "/usr/share/nginx/html" # Chemin standard pour Nginx
  }

  # Exposition du port (Configurable)
  ports {
    internal = 80
    external = var.external_port
  }

  # Politique de redémarrage (Hygiène)
  restart = "always"
}