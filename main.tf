resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}



  
 data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_family
}


resource "yandex_compute_instance" "platform_web" {
  name        = var.vm_web_name
  platform_id = var.vm_web_platform_id
  resources {
    cores         = var.resources_web["cpu"]
    memory        = var.resources_web["memory"]
    core_fraction = var.resources_web["core_fraction"]
  }
   
    
  
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  
  metadata = {
    serial-port-enable = var.metadata["serial-port-enable"]
    ssh-keys           = var.metadata["ssh-keys"]
  }

  


}



  
  
resource "yandex_compute_instance" "platform_db" {
  name        = var.vm_db_name
  platform_id = var.vm_db_platform_id
  resources {
    cores         = var.resources_db["cpu"]
    memory        = var.resources_db["memory"]
    core_fraction = var.resources_db["core_fraction"]
  }  
  
  
    
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  
  metadata = {
    serial-port-enable = var.metadata["serial-port-enable"]
    ssh-keys           = var.metadata["ssh-keys"]
  }
  
  


}



