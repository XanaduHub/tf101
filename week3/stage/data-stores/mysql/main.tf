resource "aws_db_subnet_group" "zava-dbsubnet" {
  name       = "zava-dbsubnetgroup"
  subnet_ids = [aws_subnet.zava-subnet3.id, aws_subnet.zava-subnet4.id]

  tags = {
    Name = "zava DB subnet group"
  }
}

resource "aws_db_instance" "zava-rds" {
  identifier_prefix      = "zava-t101"
  engine                 = "mysql"
  allocated_storage      = 10
  instance_class         = "db.t2.micro"
  db_subnet_group_name   = aws_db_subnet_group.zava-dbsubnet.name
  vpc_security_group_ids = [aws_security_group.zava-sg2.id]
  skip_final_snapshot    = true

  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
}