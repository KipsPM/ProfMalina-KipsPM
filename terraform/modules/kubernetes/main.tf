resource "yandex_kms_symmetric_key" "key-kubernetes" {
  name              = "key-kubernetes"
  description       = "description for key"
  default_algorithm = "AES_128"
  rotation_period   = "8760h" // equal to 1 year
}

resource "yandex_kubernetes_cluster" "otus_cluster" {
  name        = "otus_cluster"
  description = "for otus coursework"

  network_id = var.network_id

  master {
    version = "1.18"
    zonal {
      subnet_id = var.subnet_id
    }

    public_ip = true

    maintenance_policy {
      auto_upgrade = true

      maintenance_window {
        start_time = "15:00"
        duration   = "3h"
      }
    }
  }

  service_account_id      = var.service_account_key_id
  node_service_account_id = var.service_account_key_id

  # labels = {
  #   my_key       = "my_value"
  #   my_other_key = "my_other_value"
  # }

  release_channel = "RAPID"
  network_policy_provider = "CALICO"

  kms_provider {
    key_id = "${yandex_kms_symmetric_key.key-kubernetes.id}"
  }
}

resource "yandex_kubernetes_node_group" "otus_node_group" {
  cluster_id  = "${yandex_kubernetes_cluster.otus_cluster.id}"
  name        = "name"
  description = "description"
  version     = "1.18"

  # labels = {
  #   "key" = "value"
  # }

  instance_template {
    platform_id = "standard-v2"
    nat         = true

    resources {
      memory = 8
      cores  = 4
    }

    boot_disk {
      type = "network-hdd"
      size = 64
    }

    scheduling_policy {
      preemptible = false
    }
  }

  scale_policy {
    # fixed_scale {
    #   size = 4
    # }
    auto_scale {
      initial_size = 2
      max_size = 10
      min_zone_size = 3
      measurement_duration = 60
      warmup_duration = 60
      stabilization_duration = 120
      cpu_utilization_rule {
        utilization_target = 75
      }
    }
  }

  allocation_policy {
    location {
      zone = "ru-central1-a"
    }
  }

  maintenance_policy {
    auto_upgrade = true
    auto_repair  = true

    maintenance_window {
      day        = "monday"
      start_time = "15:00"
      duration   = "3h"
    }

    maintenance_window {
      day        = "friday"
      start_time = "10:00"
      duration   = "4h30m"
    }
  }
}
