#создаем 2 идентичные ВМ с разными именами
resource "yandex_compute_instance" "web1_web2" {
  
  count = length(var.vm_names)
  name  = var.vm_names[count.index]
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

    #dynamic "security_groups" {
   #for_each = yandex_compute_disk.Disks_1Gb[*].id
   #for_each = yandex_vpc_security_group.example[*].id
    
   # content{
   #security_group_ids = security_groups.value
    
 } 

  allow_stopping_for_update = true


}

