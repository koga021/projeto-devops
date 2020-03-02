
resource "aws_subnet" "DevOpsProject-FE-01" {
  vpc_id     = aws_vpc.DevOpsProject.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.ProjectName}-FE-01"
    Environment = "PROD"
    Owner ="${var.Owner}"
  }
}

resource "aws_subnet" "DevOpsProject-FE-02" {
  vpc_id     = aws_vpc.DevOpsProject.id
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.ProjectName}-FE-02"
    Environment = "PROD"
    Owner ="${var.Owner}"
  }
}

resource "aws_subnet" "DevOpsProject-BE-01" {
  vpc_id     = aws_vpc.DevOpsProject.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "${var.ProjectName}-BE-01"
    Environment = "PROD"
    Owner ="${var.Owner}"
  }
}

resource "aws_subnet" "DevOpsProject-BE-02" {
  vpc_id     = aws_vpc.DevOpsProject.id
  cidr_block = "10.0.4.0/24"

  tags = {
    Name = "${var.ProjectName}-BE-02"
    Environment = "PROD"
    Owner ="${var.Owner}"
  }
}



resource "aws_subnet" "public" {
  count      = "${length(var.availability_zones)}"
  vpc_id     = aws_vpc.DevOpsProject.id
  cidr_block = "${cidrsubnet("10.0.5.0/24",4,count.index)}"
  map_public_ip_on_launch = true

  tags = {
    Name = "${element(var.availability_zones, count.index)}"
    Environment = "PROD"
    Owner ="${var.Owner}"
  }
}
