output "address" {
  value       = aws_db_instance.zava-rds.address
  description = "Connect to the database at this endpoint"
}

output "port" {
  value       = aws_db_instance.zava-rds.port
  description = "The port the database is listening on"
}

output "vpcid" {
  value       = aws_vpc.zava-vpc.id
  description = "zava VPC Id"
}