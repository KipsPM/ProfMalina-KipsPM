variable cloud_id {
  description = "Cloud"
}
variable folder_id {
  description = "Folder"
}
variable zone {
  description = "Zone"
  default     = "ru-central1-a"
}
variable public_key_path {
  description = "Path to the public key used for ssh access"
}
variable service_account_key_file {
  description = "key.json"
}
variable private_key_path {
  description = "Path to the private key used for connection"
}
variable access_key {
  description = "Access key bucket account"
}
variable secret_key {
  description = "Secret key bucket account"
}
variable service_account_key_id {
  description = "Service account id"
}
# variable "measurement_duration" {
#   description = "Time in seconds for which the metrics are averaged over the CPU load"
# }
# variable "warmup_duration" {
#   description = "During this time, traffic is delivered to the virtual machine, but CPU load metrics are not taken into account"
# }
# variable "stabilization_duration" {
#   description = "Minimum time interval for load monitoring before Instance Groups can reduce the number of virtual machines in the group"
# }
# variable "cpu_utilization_target" {
#   description = "Target CPU utilization that Instance Groups should support"
# }
