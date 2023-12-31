terraform {



  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">= 0.87.0"
    }
  }

  # Описание бэкенда хранения состояния
  backend "s3" {
    endpoints = {
      s3 = "https://storage.yandexcloud.net/"
    }
    bucket = "terraform-state-std-024-07"
    region = "ru-central1"
    key    = "terraform.tfstate"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
  }
}



provider "yandex" {
  cloud_id  = "b1g3jddf4nv5e9okle7p"
  folder_id = "b1gk067d0krcal09flv4"
  zone      = "ru-central1-a"
}

variable "network_zone" {
  description = "Yandex.Cloud network availability zones"
  type        = string
  default     = "ru-central1-a"


}



data "yandex_vpc_network" "default" {
  name = "default"
}

data "yandex_vpc_subnet" "default" {
  name = "${data.yandex_vpc_network.default.name}-${var.network_zone}"
}


data "yandex_compute_image" "ubuntu-2004" {
  family = "ubuntu-2004-lts"
}



resource "yandex_compute_instance" "vm-1" {
  name = "chapter5-lesson2-std-024-07"


  # Конфигурация ресурсов:
  # количество процессоров и оперативной памяти
  resources {
    cores  = 2
    memory = 2
  }



  # Загрузочный диск:
  # здесь указывается образ операционной системы
  # для новой виртуальной машины
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004.image_id
    }
  }
  
  
  # Сетевой интерфейс:
  # нужно указать идентификатор подсети, к которой будет подключена ВМ
  network_interface {
    subnet_id = data.yandex_vpc_subnet.default.subnet_id
    nat       = true
  }

  # Метаданные машины:
  # здесь можно указать скрипт, который запустится при создании ВМ
  # или список SSH-ключей для доступа на ВМ

  metadata = {
  "user-data": "#cloud-config\nusers:\n  - name: ansible\n    groups: sudo\n    shell: /usr/bin/bash\n    sudo: 'ALL=(ALL) NOPASSWD:ALL'\n    ssh-authorized-keys:\n      - ${file("~/.ssh/id_rsa.pub")}\n      - ${file("~/.ssh/id_rsa_vm.pub")}"
}

 
  

}


output "ip_address_pub" {
  value = yandex_compute_instance.vm-1.network_interface.0.nat_ip_address
}
output "ip_address" {
  value = yandex_compute_instance.vm-1.network_interface.0.ip_address
}


