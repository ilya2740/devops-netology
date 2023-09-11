
resource "yandex_compute_disk" "Disks_1Gb" {

  count = length(var.Disks_names_1Gb)
  name  = var.Disks_names_1Gb[count.index]
  size   = "1"

}


resource "yandex_compute_instance" "storage" {



 name = "storage"

   resources {
    cores = 2
    memory = 1
    core_fraction = 5 

   }




# First disk (bootable)
    boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
      type = "network-hdd"
      size = "5"
    }   
  }

# Another disks

  dynamic "secondary_disk" {
   for_each = yandex_compute_disk.Disks_1Gb[*].id
    
    content{
   disk_id = secondary_disk.value
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