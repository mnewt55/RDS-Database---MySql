resource "aws_subnet" "public-eu-west-1a" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.32.1.0/24"
  availability_zone = "eu-west-1a"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "public-eu-west-1b" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.32.2.0/24"
  availability_zone = "eu-west-1b"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "public-eu-west-1c" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.32.3.0/24"
  availability_zone       = "eu-west-1c"
  map_public_ip_on_launch = true
}

resource "aws_db_subnet_group" "my_db_subnet_group" {
  name       = "my-db-subnet-group"
  subnet_ids = [aws_subnet.public-eu-west-1a.id, aws_subnet.public-eu-west-1b.id, aws_subnet.public-eu-west-1c.id]

  tags = {
    Name = "My DB Subnet Group"
  }
}