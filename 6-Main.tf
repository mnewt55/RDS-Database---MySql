resource "aws_db_instance" "default" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "8.0.35"
  instance_class       = "db.t3.micro"
  db_name              = "mydb"
  identifier           = "database-1"
  username             = "dbuser"
  password             = "dbpassword"
  parameter_group_name = "default.mysql8.0"
  publicly_accessible  = true
  multi_az             = false
  backup_retention_period = 0

  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.my_db_subnet_group.name

  skip_final_snapshot = true

  timeouts {
    create = "60m"
    delete = "60m"
    update = "60m"
  }
}
