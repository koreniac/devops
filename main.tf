terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"

    }
  }
}


provider "docker" {
  #   host = "tcp://127.0.0.1:2376/"
}

resource "docker_image" "node_image" {
  name = "node-image"
  build {

    path = "."
    dockerfile = "Dockerfile"
    tag = ["v1.0"]
  }
}
resource "docker_network" "node_network" {
  name   = "node_network"
  driver = "bridge"
}
resource "docker_container" "node-app" {
  name = "node-app"
  image = docker_image.node_image.name
  env   = ["NODE_ENV=dev"]
  ports {
    internal = 3000
    external = 3000
  }
  networks_advanced {
    name    = docker_network.node_network.name
    aliases = ["docknet"]
  }
  depends_on = [
    docker_container.graphite
  ]
}

resource "docker_container" "graphite" {
  name  = "graphite"
  image = "graphiteapp/graphite-statsd"
  env   = ["TZ=Asia/Bangkok"]
  ports {
    internal = 80
    external = 80
  }
  ports {
    internal = 2003
    external = 2003
  }
  ports {
    internal = 2004
    external = 2004
  }
  ports {
    internal = 2023
    external = 2023
  }
  ports {
    internal = 2024
    external = 2024
  }
  ports {
    internal = 8125
    external = 8125
    protocol = "udp"
  }
  ports {
    internal = 8126
    external = 8126
  }
  networks_advanced {
    name    = docker_network.node_network.name
    aliases = ["docknet"]
  }
}
