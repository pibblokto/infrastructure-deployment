data "aws_availability_zones" "alive" {
  state = "available"
}

locals {
  az_amount = length(data.aws_availability_zones.alive.names)
}

### VPC

resource "aws_vpc" "eks_vpc" {
  cidr_block = var.vpc_range
  tags = {
    Name = "${var.environment}-eks-vpc"
  }
}

### Subnets ###

resource "aws_subnet" "private_subnets" {
  vpc_id            = aws_vpc.eks_vpc.id
  count             = length(var.private_subnets)
  cidr_block        = element(var.private_subnets, count.index)
  availability_zone = data.aws_availability_zones.alive.names[count.index % local.az_amount]
  tags = {
    Name = "${var.environment}-private-subnet-${count.index + 1}"
    "kubernetes.io/role/elb" = "1"
  }
}

resource "aws_subnet" "public_subnets" {
  vpc_id                  = aws_vpc.eks_vpc.id
  count                   = length(var.public_subnets)
  cidr_block              = element(var.public_subnets, count.index)
  availability_zone       = data.aws_availability_zones.alive.names[count.index % local.az_amount]

  tags = {
    Name = "${var.environment}-public-subnet-${count.index + 1}"
    "kubernetes.io/role/elb" = "1"
  }
}

### Internet Gateway ###

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.eks_vpc.id

  tags = {
    Name = "${var.environment}-eks-main-gw"
  }
}

### NAT Gateway ###

resource "aws_eip" "nat_eip" {
  tags = {
    Name = "${var.environment}-nat-eip"
  }
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnets[0].id

  tags = {
    Name = "${var.environment}-nat-gateway"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}

### Public subnet route table ###

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.environment}-public-route-table"
  }
}

### EKS subnets route table

resource "aws_route_table" "eks_route_table" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }

  tags = {
    Name = "${var.environment}-eks-route-table"
  }
}

### Route tables associations

resource "aws_route_table_association" "private_association" {
  count          = length(var.private_subnets)
  subnet_id      = element(aws_subnet.private_subnets[*].id, count.index)
  route_table_id = aws_route_table.eks_route_table.id
}

resource "aws_route_table_association" "public_association" {
  count          = length(var.public_subnets)
  subnet_id      = element(aws_subnet.public_subnets[*].id, count.index)
  route_table_id = aws_route_table.public_route_table.id
}