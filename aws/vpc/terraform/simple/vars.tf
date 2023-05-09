# Variables

# Vatiable definitions 

variable "vpc_1_cidr_1_local" {
  type    = string
  default = "10.0.0.0/16"
}
variable "subnet_1_local" {
  type    = string
  default = "10.0.101.0/24"
}
variable "subnet_2_local" {
  type    = string
  default = "10.0.102.0/24"
}
variable "subnet_3_local" {
  type    = string
  default = "10.0.103.0/24"
}
variable "subnet_public_local_1" {
  type    = string
  default = "10.0.201.0/24"
}
variable "subnet_public_local_2" {
  type    = string
  default = "10.0.202.0/24"
}
variable "subnet_public_local_3" {
  type    = string
  default = "10.0.203.0/24"
}
variable "region_local" {
  type    = string
  default = "eu-north-1"
}
variable "sub_region_1_local" {
  type    = string
  default = "eu-north-1a"
}
variable "sub_region_2_local" {
  type    = string
  default = "eu-north-1b"
}
variable "sub_region_3_local" {
  type    = string
  default = "eu-north-1c"
}