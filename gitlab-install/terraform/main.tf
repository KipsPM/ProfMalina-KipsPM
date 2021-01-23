provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}
terraform {
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "kipspm"
    region     = "ru-central-1"
    key        = "stage/terraform.tfstate"
    access_key = "tYp5jV0YNXdAPs5djR3r"
    secret_key = "5uZoQwCZjzBg7NUE0_mHSQAiVPgwktWr56AUoXje"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
module "app" {
  source           = "../modules/app"
  public_key_path  = var.public_key_path
  app_disk_image   = var.app_disk_image
  subnet_id        = var.subnet_id
  db_url           = module.db.mongodb_url
  private_key_path = var.private_key_path
}

module "db" {
  source           = "../modules/db"
  public_key_path  = var.public_key_path
  db_disk_image    = var.db_disk_image
  subnet_id        = var.subnet_id
  private_key_path = var.private_key_path
}
