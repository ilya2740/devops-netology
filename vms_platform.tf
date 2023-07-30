
variable "vm_web_family" {
  type        = string
  default     = "ubuntu-2204-lts"
  description = "Ubuntu family name"
}


variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "Platform name"
}


variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "platform_id name"
}


#variable "vm_web_cores" {
#  type        = number
#  default     = 2
#  description = "cores namber"
#}


#variable "vm_web_memory" {
#  type        = number
#  default     = 1
#  description = "memory namber"
#}


#variable "vm_web_core_fraction" {
#  type        = number
#  default     = 50
#  description = "core fraction namber"
#}





variable "vm_db_family" {
  type        = string
  default     = "ubuntu-2204-lts"
  description = "Ubuntu family name"
}


variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "Platform name"
}


variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "platform_id name"
}


#variable "vm_db_cores" {
#  type        = number
#  default     = 2
#  description = "cores namber"
#}


#variable "vm_db_memory" {
#  type        = number
#  default     = 2
#  description = "memory namber"
#}


#variable "vm_db_core_fraction" {
#  type        = number
#  default     = 20
#  description = "core fraction namber"
#}


