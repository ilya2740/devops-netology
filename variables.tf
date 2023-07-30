###cloud vars



variable "resources_web" {
type=map
default= {
cpu = 2
memory = 1
core_fraction = 50
}
}



variable "resources_db" {
type=map
default= {
cpu = 2
memory = 2
core_fraction = 20
}
}





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
  description = "VPC network & subnet name"
}



variable "metadata" {
type=map
default= {
serial-port-enable = 1
ssh-keys = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMdnCJVCblNgg2wBAomp1kk04//yJsxxQCZEfKFcAp+A user@debian"
}
}

