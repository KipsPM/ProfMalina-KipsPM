resource "yandex_vpc_network" "kubernetes_network" {
  name = "kubernetes-network"
  labels = {
    tags = "kubernetes-network"
  }
}

resource "yandex_vpc_subnet" "kubernetes_subnet" {
  name = "kubernetes"
  labels = {
    tags = "kubernetes"
  }
  network_id     = yandex_vpc_network.kubernetes_network.id
  v4_cidr_blocks = ["10.240.0.0/24"]
}

# как вариант заранее создавать ip
# resource "yandex_vpc_address" "addr" {
#   name = "kubernetes-external-ip"

#   external_ipv4_address {
#     zone_id = "ru-central1-a"
#   }
# }
