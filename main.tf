provider "aws" {
  region = "us-east-1"  # Replace with your desired AWS region
}

resource "aws_ec2_transit_gateway" "example" {
  description = "Transit Gateway Example"
}

resource "aws_ec2_transit_gateway_vpc_attachment" "attachment" {
  count              = 5
  transit_gateway_id = aws_ec2_transit_gateway.example.id
  vpc_id             = var.vpc_ids[count.index]
  subnet_ids         = var.subnet_ids[count.index]
  dns_support        = "enable"

  tags = {
    Name = "TGW-Attachment-${count.index + 1}"
  }
}

resource "aws_ec2_transit_gateway_route_table" "route_table" {
  transit_gateway_id = aws_ec2_transit_gateway.example.id

  route {
    cidr_block                   = "0.0.0.0/0"
    transit_gateway_attachment_id = aws_ec2_transit_gateway_vpc_attachment.attachment[count.index].id
  }
}
