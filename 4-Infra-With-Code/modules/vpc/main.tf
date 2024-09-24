#VPC creation 

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "jenkins-vpc"
  }
}

#basically we are created VPC with lot of range.  
#withing that vpc range you are taking the small area and creating a small range called subnets.   

#subnet-1 creation 

resource "aws_subnet" "sub-1" {
  vpc_id                  = aws_vpc.main.id
  availability_zone       = var.availability_zone-1
  cidr_block              = var.availability_zone-1_cidr
  map_public_ip_on_launch = true
  tags = {
    Name = "my_subnet-1"
  }
}


#subnet-2 creation   

resource "aws_subnet" "sub-2" {
  vpc_id                  = aws_vpc.main.id
  availability_zone       = var.availability_zone-2
  cidr_block              = var.availability_zone-2_cidr
  map_public_ip_on_launch = true
  tags = {
    Name = "my_subnet-2"
  }
}


#internet_gateway creation  

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "my_gateway"
  }
}


#route table  creation  

resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.route_table_cidr
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "route_table"
  }
}


#Assigning route table to subnet-1 

resource "aws_route_table_association" "sub1-association" {
  subnet_id      = aws_subnet.sub-1.id
  route_table_id = aws_route_table.my_route_table.id
}


#Assigning route table to subnet-2 

resource "aws_route_table_association" "sub2-association" {
  subnet_id      = aws_subnet.sub-2.id
  route_table_id = aws_route_table.my_route_table.id
}
