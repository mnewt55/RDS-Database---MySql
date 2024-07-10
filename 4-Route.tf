resource "aws_route_table" "rds_db_route_table" {
  vpc_id = aws_vpc.my_vpc.id
  
  tags = {
    Name = "rds-db-route-table"
  }
}

resource "aws_route" "rds_to_internet" {
  route_table_id         = aws_route_table.rds_db_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.my_igw.id
}

resource "aws_route_table_association" "public1_association" {
  subnet_id      = aws_subnet.public-eu-west-1a.id
  route_table_id = aws_route_table.rds_db_route_table.id
}

resource "aws_route_table_association" "public2_association" {
  subnet_id      = aws_subnet.public-eu-west-1b.id
  route_table_id = aws_route_table.rds_db_route_table.id
}

resource "aws_route_table_association" "public3_association" {
  subnet_id      = aws_subnet.public-eu-west-1c.id
  route_table_id = aws_route_table.rds_db_route_table.id
}

# Repeat for additional public subnets as needed

