#создаем 2 идентичные ВМ
resource "yandex_compute_instance" "example" {
  
  count = length(var.vm_names)
  name  = var.vm_names[count.index]
  platform_id = "standard-v1"


  #count = 2
  #name        = "web-${count.index}"

  #resources {
  #  cores  = 2
  #  memory = 1
  #  core_fraction = 20
  #}

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
      type = "network-hdd"
      size = 5
    }   
  }

  metadata = {
    ssh-keys = "ubuntu:${var.public_key}"
  }

  scheduling_policy { preemptible = true }

  network_interface { 
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }
  allow_stopping_for_update = true
}