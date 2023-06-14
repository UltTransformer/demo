resource "aws_eip" "nat_gw_eip" {
  vpc = true
}

resource "aws_nat_gateway" "nat_gw_1" {
  allocation_id = aws_eip.nat_gw_eip.id
  subnet_id     = aws_subnet.subnet_public_1.id
}
