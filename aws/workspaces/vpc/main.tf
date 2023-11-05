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

# Security Groups

resource "aws_security_group" "allow_all_egress" {
  name        = "allow-all-egress"
  description = "Allow all outbound traffic"

  vpc_id = aws_vpc.vpc_1.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # All protocols
    cidr_blocks = ["0.0.0.0/0"]  # Allow traffic to all destinations (any IP)
  }
}

# # Simple AD

# resource "aws_directory_service_directory" "simple_ad" {
#   name     = "CN-simple-ad-directory"
#   password = var.simple_ad_pwd  # Replace with your desired password

#   size       = "Small"  # You can choose the appropriate size
#   edition    = "Standard"
#   type       = "SimpleAD"
#   vpc_settings {
#     vpc_id     = aws_vpc.vpc_1.id 
#     subnet_ids = [aws_subnet.subnet_public_1.id, aws_subnet.subnet_public_2.id, aws_subnet.subnet_public_3.id]  

#   security_group_ids = aws_security_group.allow_all_egress.id
# }

# resource "aws_directory_service_directory_password_policy" "password_policy" {
#   directory_id = aws_directory_service_directory.simple_ad.id

#   minimum_length    = 8
#   require_lowercase = true
#   require_numbers   = true
#   require_symbols   = true
#   require_uppercase = true
# }
# }

# output "directory_id" {
#   value = aws_directory_service_directory.simple_ad.id
# }

# output "dns_ip_addresses" {
#   value = aws_directory_service_directory.simple_ad.dns_ip_addresses
# }

