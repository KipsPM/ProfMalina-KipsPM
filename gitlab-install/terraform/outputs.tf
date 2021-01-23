output "external_ip_address_app" {
  value = module.app.external_ip_address_app
}
output "external_ip_address_db" {
  value = module.db.external_ip_address_db
}

resource "local_file" "AnsibleInventory" {
 content = templatefile("inventory.json",
 {
  external_ip_address_app = module.app.external_ip_address_app,
  external_ip_address_db = module.db.external_ip_address_db
 }
 )
 filename = "../../ansible/environments/stage/inventory.json"
}
