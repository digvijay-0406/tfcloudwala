terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Pulls the image
resource "docker_image" "myimg" {
  name = "nginx:latest"
}

# Create a container
resource "docker_container" "nginxwala" {
  image = docker_image.myimg.image_id
  name  = "nginxwala"
}
resource "null_resource" "exec" {
  provisioner "local-exec" {
    interpreter = [ "/bin/bash" ]
    command = "${path.module}/docker.sh"
  }
}
