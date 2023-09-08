#создаем 2 разные ВМ с разными параметрами
resource "yandex_compute_instance" "main_replica" {

    for_each = { for server in var.servers : server.name => server }
    
    name    =  each.key
    #image   =  each.value.image
    #size    =  each.value.size
    #region  =  each.value.region
    #tags   = each.value.tags


    resources {
    cores  = each.value.cores
    memory = each.value.memory
    core_fraction = each.value.core_fraction
  }


    boot_disk {
    initialize_params {
      #image_id =  each.value.image
      image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
      type = "network-hdd"
      size = "5"
    }   
  }


depends_on = [ yandex_compute_instance.web1_web2 ]

metadata = {
    ssh-keys = "ubuntu:${var.public_key}"
  }

  scheduling_policy { preemptible = true }

  network_interface { 
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }
  allow_stopping_for_update = true



#depends_on = [yandex_compute_instance.main_replica]

}