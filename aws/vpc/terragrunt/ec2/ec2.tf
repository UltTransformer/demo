# instance 1

resource "aws_network_interface" "ec2_1" {
  subnet_id = data.aws_subnet.subnet_id
  security_groups = [
    aws_security_group.security_group.id,
  ]
}

resource "aws_instance" "ec2_1" {
  ami               = data.aws_ami.amazon_linux.id
  instance_type     = var.ec2_instance_size
  availability_zone = var.region

  network_interface {
    network_interface_id = aws_network_interface.ec2_1.id
    device_index         = 0
  }
  tags = {
    Name = var.ec2-instance-name
  }
}

