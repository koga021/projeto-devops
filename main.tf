#export AWS_ACCESS_KEY_ID="sua access key amazon"
#export AWS_SECRET_ACCESS_KEY="sua secret key amazon"
#export AWS_DEFAULT_REGION="sua regiao"

provider "aws" {
  version = "~> 2.0"
}

resource "aws_vpc" "DevOpsProject" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "${var.ProjectName}"
    Environment = "PROD"
  }
}

resource "aws_internet_gateway" "DevOpsProject" {
  vpc_id = "${aws_vpc.DevOpsProject.id}"
  tags = {
    Name = "${var.ProjectName}"
    Environment = "PROD"
    Owner ="${var.Owner}"
  }
}

resource "aws_route" "DevOpsProject" {
  route_table_id         = "${aws_vpc.DevOpsProject.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.DevOpsProject.id}"

  
}

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


resource "aws_eip" "DevOpsProject" {
  vpc      = true
  tags = {
    Name = "${var.ProjectName}"
    Environment = "PROD"
    Owner ="${var.Owner}"
  }
}
resource "aws_nat_gateway" "DevOpsProject-01" {
  allocation_id = "${aws_eip.DevOpsProject.id}"
  subnet_id     = "${aws_subnet.DevOpsProject-FE-01.id}"
}
