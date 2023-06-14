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