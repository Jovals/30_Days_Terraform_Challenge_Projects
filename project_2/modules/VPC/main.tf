
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "${var.project_name}-vpc"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.project_name}-igw"
  }
}

resource "aws_subnet" "subnets" {
  count                   = length(var.azs)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.cidr_block, 8, count.index)
  availability_zone       = element(var.azs, count.index)
  map_public_ip_on_launch = var.map_public_ip
  tags = {
    Name = "subnet-${count.index + 1}"
  }
}


resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.project_name}-route-table"
  }
}

resource "aws_route" "internet_access" {
  route_table_id         = aws_route_table.main.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id
}


resource "aws_route_table_association" "subnets" {
  for_each = { for idx, subnet_id in aws_subnet.subnets[*].id : idx => subnet_id }

  subnet_id      = each.value
  route_table_id = aws_route_table.main.id
}
