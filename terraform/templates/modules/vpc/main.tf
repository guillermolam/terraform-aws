/*  AWS VPC MODULE
  *   This module can be consumed to create a new VPC using terraform .
  *   The variables required should be passed via the variables.tf file
  *   The module outputs the 'id' and 'cidr' of the vpc  created.
*/

resource "aws_vpc" "vpc" {
  cidr_block                       = "${var.vpc_cidr}"
  instance_tenancy                 = "${var.instance_tenancy}"
  enable_dns_hostnames             = "${var.enable_dns_hostnames}"
  enable_dns_support               = "${var.enable_dns_support}"
  assign_generated_ipv6_cidr_block = "${var.assign_generated_ipv6_cidr_block}"
  tags                             = "${merge(var.tags, map("Name", format(var.vpc_name)))}"
}
