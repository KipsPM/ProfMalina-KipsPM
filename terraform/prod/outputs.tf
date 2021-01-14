output "external_ip_address_controller" {
  value = module.kubernetes.external_ip_cluster
}

### The Ansible inventory file
# resource "local_file" "AnsibleInventory" {
#   content = templatefile("inventory.tmpl",
#     {
#       name_controller                = module.controller.name_controller,
#       external_ip_address_controller = module.controller.external_ip_address_controller,
#       name_worker                    = module.worker.name_worker,
#       external_ip_address_worker     = module.worker.external_ip_address_worker,
#     }
#   )
#   filename = "../../ansible/environments/prod/inventory"
# }
