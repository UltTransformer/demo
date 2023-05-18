# Defining outputs

output "vpc_1" {
  value = aws_vpc.vpc_1.id
}
output "subnet_1" {
  value = aws_subnet.subnet_1.id
}
output "subnet_2" {
  value = aws_subnet.subnet_2.id
}
output "subnet_3" {
  value = aws_subnet.subnet_3.id
}
