# Provider

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
}

# VPC
resource "aws_vpc" "vpc_1" {
  cidr_block           = var.vpc_1_cidr_1
  enable_dns_hostnames = true
  tags = {
    Name = "vpc_1"
    Name = "$TF_VAR_state_string"
  }
}

# Subnet(s)

resource "aws_subnet" "subnet_1" {
  vpc_id                  = aws_vpc.vpc_1.id
  cidr_block              = var.subnet_1
  availability_zone       = var.sub_region_1
  map_public_ip_on_launch = false
  tags = {
    Name = "subnet_1"
  }
}
resource "aws_subnet" "subnet_2" {
  vpc_id                  = aws_vpc.vpc_1.id
  cidr_block              = var.subnet_2
  availability_zone       = var.sub_region_2
  map_public_ip_on_launch = false
  tags = {
    Name = "subnet_2"
  }
}
resource "aws_subnet" "subnet_3" {
  vpc_id                  = aws_vpc.vpc_1.id
  cidr_block              = var.subnet_3
  availability_zone       = var.sub_region_3
  map_public_ip_on_launch = false
  tags = {
    Name = "subnet_3"
  }
}
resource "aws_subnet" "subnet_public_1" {
  vpc_id                  = aws_vpc.vpc_1.id
  cidr_block              = var.subnet_public_1
  availability_zone       = var.sub_region_1
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet_public_1"
  }
}
resource "aws_subnet" "subnet_public_2" {
  vpc_id                  = aws_vpc.vpc_1.id
  cidr_block              = var.subnet_public_2
  availability_zone       = var.sub_region_2
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet_public_2"
  }
}
resource "aws_subnet" "subnet_public_3" {
  vpc_id                  = aws_vpc.vpc_1.id
  cidr_block              = var.subnet_public_3
  availability_zone       = var.sub_region_3
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet_public_3"
  }
}

# Route table

resource "aws_route_table" "route_table_private" {
  vpc_id = aws_vpc.vpc_1.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw_1.id
  }
}
resource "aws_route_table" "route_table_public" {
  vpc_id = aws_vpc.vpc_1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}
resource "aws_route_table_association" "route_table_private_association_subnet_1" {
  subnet_id      = aws_subnet.subnet_1.id
  route_table_id = aws_route_table.route_table_private.id
}
resource "aws_route_table_association" "route_table_private_association_subnet_2" {
  subnet_id      = aws_subnet.subnet_2.id
  route_table_id = aws_route_table.route_table_private.id
}
resource "aws_route_table_association" "route_table_private_association_subnet_3" {
  subnet_id      = aws_subnet.subnet_3.id
  route_table_id = aws_route_table.route_table_private.id
}
resource "aws_route_table_association" "route_table_public_association_subnet_public_1" {
  subnet_id      = aws_subnet.subnet_public_1.id
  route_table_id = aws_route_table.route_table_public.id
}
resource "aws_route_table_association" "route_table_public_association_subnet_public_2" {
  subnet_id      = aws_subnet.subnet_public_2.id
  route_table_id = aws_route_table.route_table_public.id
}
resource "aws_route_table_association" "route_table_public_association_subnet_public_3" {
  subnet_id      = aws_subnet.subnet_public_3.id
  route_table_id = aws_route_table.route_table_public.id
}

# NAT GW

resource "aws_eip" "nat_gw_eip" {
  vpc = true
}

resource "aws_nat_gateway" "nat_gw_1" {
  allocation_id = aws_eip.nat_gw_eip.id
  subnet_id     = aws_subnet.subnet_public_1.id
}

# IGW

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_1.id
}

