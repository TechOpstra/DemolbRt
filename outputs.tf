output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.demo_vpc.id
}

output "public_subnet_az1_id" {
  description = "The ID of the public subnet in AZ1"
  value       = aws_subnet.public_subnet_az1.id
}

output "public_subnet_az2_id" {
  description = "The ID of the public subnet in AZ2"
  value       = aws_subnet.public_subnet_az2.id
}

output "public_subnet_az3_id" {
  description = "The ID of the public subnet in AZ3"
  value       = aws_subnet.public_subnet_az3.id
}

output "alb_dns_name" {
  description = "The DNS name of the ALB"
  value       = aws_lb.demo_alb.dns_name
}
