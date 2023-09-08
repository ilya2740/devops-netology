resource "local_file" "ansible_inventory" {
  filename = "./inventory_test"
  content  = templatefile("${path.module}/inventory.tftpl", {
  
    webservers = yandex_compute_instance.web1_web2,
    databases  = yandex_compute_instance.main_replica,
     storage    = yandex_compute_instance.storage 
  })
}


