############################################################
# SG RULES WITH CIDR BLOCKS AND NO SOURCE SECURITY GROUP ID
############################################################
resource "aws_security_group_rule" "SecurityGroupingressrule" {
    count       = "${length(var.ingress_rules)}"
    type        = "${lookup(var.ingress_rules[count.index], "type")}"
    from_port   = "${lookup(var.ingress_rules[count.index], "from_port")}"
    to_port     = "${lookup(var.ingress_rules[count.index], "to_port")}"
    protocol    = "${lookup(var.ingress_rules[count.index], "protocol")}"
    cidr_blocks    = "${split(",",lookup(var.ingress_rules[count.index], "cidr_blocks"))}"
    security_group_id = "${var.security_group_id}"
# optional 
     ipv6_cidr_blocks = "${compact(split(",", lookup(var.ingress_rules[count.index], "ipv6_cidr_blocks")))}"
#    self                     = "${compact(split(",", lookup(var.egress_rules[count.index], "self")))}"

}

resource "aws_security_group_rule" "SecurityGroupegressrule" {
    count       = "${length(var.egress_rules)}"
    type        = "${lookup(var.egress_rules[count.index], "type")}"
    from_port   = "${lookup(var.egress_rules[count.index], "from_port")}"
    to_port     = "${lookup(var.egress_rules[count.index], "to_port")}"
    protocol    = "${lookup(var.egress_rules[count.index], "protocol")}"
    cidr_blocks    = "${split(",",lookup(var.egress_rules[count.index], "cidr_blocks"))}"
    security_group_id = "${var.security_group_id}"

# optional
    prefix_list_ids = "${compact(split(",", lookup(var.egress_rules[count.index], "prefix_list_ids")))}"
    ipv6_cidr_blocks =  "${compact(split(",", lookup(var.egress_rules[count.index], "ipv6_cidr_blocks")))}"
#    self                     = "${compact(split(",", lookup(var.egress_rules[count.index], "self")))}"

}