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
