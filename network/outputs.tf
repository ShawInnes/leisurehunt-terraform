# output "bastion_public_dns" {
#   description = "The bastion EC2"
#   value       = "${length(module.bastion_ec2.public_dns) > 0 ? element(concat(module.bastion_ec2.public_dns, list("")), 0) : ""}"
# }
# output "bastion_public_ip" {
#   description = "The bastion IP"
#   value       = "${length(module.bastion_ec2.public_ip) > 0 ? element(concat(module.bastion_ec2.public_ip, list("")), 0) : ""}"
# }
