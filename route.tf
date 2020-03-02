resource "aws_route" "DevOpsProject" {
  route_table_id         = "${aws_vpc.DevOpsProject.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.DevOpsProject.id}"

  
}
