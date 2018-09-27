// Internet Gateway Valriables

variable "vpc_id" {}
variable "vpc_name" {}
variable "route_table_id" {}
variable "destination_cidr_block" {default="0.0.0.0/0"}
variable "tags" {type="map"}
