
data "yandex_compute_image" "os_name" {
  family = var.os_family
}



resource "yandex_compute_instance" "vm-1" {
  name = var.VM_name
  platform_id = var.CPUs_in_use
  zone = var.zone

  # Конфигурация ресурсов:
  # количество процессоров и оперативной памяти
  resources {
    cores  = var.core_number
    memory = var.RAM_size
  }
  
  scheduling_policy {
      preemptible = var.preemptible_VM
    }
    
  # Загрузочный диск:
  # здесь указывается образ операционной системы
  # для новой виртуальной машины
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.os_name.image_id
      size = var.disk_size # Disk size in Gb
    }
  }
  
  
  # Сетевой интерфейс:
  # нужно указать идентификатор подсети, к которой будет подключена ВМ
  network_interface {
    subnet_id = var.yandex_vpc_subnet[var.zone].subnet_id
    nat       = true
  }

  # Метаданные машины:
  # здесь можно указать скрипт, который запустится при создании ВМ
  # или список SSH-ключей для доступа на ВМ

  metadata = {
  "user-data": "#cloud-config\nusers:\n  - name: ansible\n    groups: sudo\n    shell: /usr/bin/bash\n    sudo: 'ALL=(ALL) NOPASSWD:ALL'\n    ssh-authorized-keys:\n      - ${file("~/.ssh/id_rsa.pub")}\n      - ${file("~/.ssh/id_rsa_vm.pub")}"
}
 
 
}


