variable "ami" {}

variable "cdirs_acesso" {
  type = list(any)
}

variable "sgs_acesso" {
  type = list(any)
}

variable "ingress_ports" {
  type = list(any)
}

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

variable "vpc_id" {}

variable "disk_size" {}

variable "tag" {}