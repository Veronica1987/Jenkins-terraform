resource "aws_vpc" "terrafrom_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = var.tenancy

  tags = {
    Name = "${terraform.workspace}-terraform-vpc"
  }
}


