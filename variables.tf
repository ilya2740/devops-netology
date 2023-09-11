

###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}




variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "public_key" {
  type    = string
  default = ""
}

variable "vm_names" {
  description = "Create VM with these names"
  type        = list(string)
  default     = ["web1", "web2"]
}


variable "servers" {
    type = list(object({
        name  = string,
        #size = string,
        image = string,
        #region = string
        tags = list(string)
        cores  =  number,
        memory =  number,
        core_fraction =  number,
        disk = number
    }))
}

variable "Disks_names_1Gb" {
  description = "Create 1Gb disks with these names"
  type        = list(string)
  default     = ["disk1", "disk2", "disk3"]
}






variable "another_disks" {
  type = list(object({
    name = string
    
  }))
  default = [
    {
      name = "disk1"
    },
    {
      name = "disk2"
    },
    {
      name = "disk3"

    }
  ]
}







variable "sg_ports" {
  type        = list(number)
  description = "list of ingress ports"
  default     = ["1", "2" , "3"]
}


variable "storage" {

   type = list(object({
        name = string,
        cores = number,
        memory = number,
        core_fraction = number
  
   }))

}

