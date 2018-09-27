# Outputs

output "vpc_id" {
  value = "${module.vpc.vpc_id}"
}

output "public_security_group_id" {
  value = "${module.public_dmz.sgid}"
}

output "private_security_group_id" {
  value = "${module.public_dmz.sgid}"
}

output "vpcflowlog_id" {
  value = "${module.vpc_flow_log.vpc_flolog_id}"
}

# FlowLog RoleID and Role Arn
output "vpcflowlog_role_id" {
  value = "${module.awsvpcflowlogrole.roleid}"
}

output "vpcflowlog_role_arn" {
  value = "${module.awsvpcflowlogrole.rolearn}"
}
