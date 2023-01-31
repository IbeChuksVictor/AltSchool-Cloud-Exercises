# Creates a VPC
resource "aws_vpc" "ASTE-vpc" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"

  tags = {
    Name = "${var.project_name}-vpc"
  }
}

# Creates Public Subnets
resource "aws_subnet" "ASTE-subnets" {
  vpc_id            = aws_vpc.ASTE-vpc.id
  for_each          = var.public_subnet
  cidr_block        = each.value["sub_cidr_block"]
  availability_zone = each.value["AZ"]

  tags = {
    Name = "${var.project_name}-Subnet-${each.key}"
  }
}

# Creates Internet Gateway
resource "aws_internet_gateway" "ASTE-igw" {
  vpc_id = aws_vpc.ASTE-vpc.id

  tags = {
    Name = "${var.project_name}-igw"
  }
}

# Creates a Route Table
resource "aws_route_table" "ASTE-rtb" {
  vpc_id = aws_vpc.ASTE-vpc.id

  tags = {
    Name = "${var.project_name}-rtb"
  }
}

# Creates a Route for the Route Table
resource "aws_route" "ASTE-rt" {
  route_table_id         = aws_route_table.ASTE-rtb.id
  destination_cidr_block = var.destination_cidr_block
  gateway_id             = aws_internet_gateway.ASTE-igw.id
}

# Associates the Route Table with the Public Subnets
resource "aws_route_table_association" "ASTE-rtb-association" {
  for_each       = var.public_subnet
  subnet_id      = aws_subnet.ASTE-subnets[each.key].id
  route_table_id = aws_route_table.ASTE-rtb.id
}

# Output Variables for the VPC and Subnets
output "vpc_id" {
  value = aws_vpc.ASTE-vpc.id
}

output "ASTE-subnets" {
  value = { for AZ, subnets in aws_subnet.ASTE-subnets : AZ => subnets.id }
}

output "internet_gateway" {
  value = aws_internet_gateway.ASTE-igw
}