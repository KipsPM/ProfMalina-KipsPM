# Адрес получается сильно позже, либо создавать заранее и потом его передавать либо что то еще
output "external_cluster_ip" {
  value = module.kubernetes.external_cluster_ip
}
