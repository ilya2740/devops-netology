

output "name" {
  value = concat( [for i  in yandex_compute_instance.web1_web2 : 
  { name = i.name
    id   = i.id 
    fqdn = i.fqdn
  } 
  ]
  ,
  [for iz  in yandex_compute_instance.main_replica : 
  { name = iz.name
    id   = iz.id 
    fqdn = iz.fqdn
  } 
  ]
  ,
  [
  
    {"name" = yandex_compute_instance.storage.name ,  "id" = yandex_compute_instance.storage.id ,  "fqdn" = yandex_compute_instance.storage.fqdn} 
    
  ]

  )
  






  
}






#output "name" {
#  value =  [for i  in yandex_compute_instance.web1_web2 : 
#  { name = i.name 
#    id   = i.id   
#    fqdn = i.fqdn
  
#  } ]
        
#    } 
  
 



