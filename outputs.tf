
   
   output "vm_external_ip_address" {
   
    value = { 
    "yandex_compute_instance.platform_web"= yandex_compute_instance.platform_web.network_interface[0].nat_ip_address
    "yandex_compute_instance.platform_db"= yandex_compute_instance.platform_db.network_interface[0].nat_ip_address
    } 
     }
   

