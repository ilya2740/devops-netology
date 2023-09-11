#создаем 2 идентичные ВМ с разными именами
resource "yandex_compute_instance" "web1_web2" {

for_each = toset([ "1", "2" ])

name = "web${each.key}"

  
  platform_id = "standard-v1"

 resources { 
    cores  = 2
    memory = 1
    core_fraction = 20
}



  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
      type = "network-hdd"
      size = "5"
    }   
  }

  metadata = {
    ssh-keys = "ubuntu:${var.public_key}"
  }

  scheduling_policy { preemptible = true }

  network_interface { 
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
    security_group_ids = [yandex_vpc_security_group.example.id]

    
 } 

  allow_stopping_for_update = true


}

