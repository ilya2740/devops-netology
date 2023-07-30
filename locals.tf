
locals {

 name_web = "${ var.vm_web_name }-${ var.vm_web_platform_id }-${ var.vm_web_family }"
 name_db  = "${ var.vm_db_name }-${ var.vm_db_platform_id }-${ var.vm_db_family }"

}
