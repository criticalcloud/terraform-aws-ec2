variable "ami" {}

variable "user_data" {
  type = string
  default = ""
}

variable "client_name" {}

variable "instance_type" {}

variable "environment" {}

variable "key_name" {}

variable "zona" {}

variable "subnet_id" {}

variable "disk_size" {}

variable "tag" {}
