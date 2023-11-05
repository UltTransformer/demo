# Variables

# Vatiable definitions 

variable "vpc_1_cidr_1" {
  type    = string
  default = "10.0.0.0/16"
}
variable "subnet_1" {
  type    = string
  default = "10.0.101.0/24"
}
variable "subnet_2" {
  type    = string
  default = "10.0.102.0/24"
}
variable "subnet_3" {
  type    = string
  default = "10.0.103.0/24"
}
variable "subnet_public_1" {
  type    = string
  default = "10.0.201.0/24"
}
variable "subnet_public_2" {
  type    = string
  default = "10.0.202.0/24"
}
variable "subnet_public_3" {
  type    = string
  default = "10.0.203.0/24"
}
variable "region" {
  type    = string
  default = "eu-north-1"
}
variable "sub_region_1" {
  type    = string
  default = "eu-north-1a"
}
variable "sub_region_2" {
  type    = string
  default = "eu-north-1b"
}
variable "sub_region_3" {
  type    = string
  default = "eu-north-1c"
}
variable "simple_ad_pwd" {
  type    = string
}