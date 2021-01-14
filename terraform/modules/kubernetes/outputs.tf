output "external_ip_cluster" {
  value = yandex_kubernetes_cluster.otus_cluster.master[0].public_ip
}
