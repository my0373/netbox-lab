########################
# URL Outputs
########################

output "nbe_console_url" {
  value       = "https://${aws_instance.nbe_instance.public_ip}:30000"
  description = "NetBox Enterprise console URL"
}

output "nbe_webui_url" {
  value       = "https://${aws_instance.nbe_instance.public_ip}"
  description = "NetBox Enterprise web UI URL"
}

output "nbc_url" {
  value       = "https://${aws_instance.nbc_instance.public_ip}"
  description = "NetBox Community URL"
}

########################
# Other Variables
########################

output "postgres_host" {
  value       = aws_db_instance.postgres.address
  description = "PostgreSQL host address"
}

output "aws_region" {
  value       = var.aws_region
  description = "AWS region where the resources are deployed"
}



output "cluster_name" {
  value       = var.cluster_name
  description = "Name of the cluster"
}

output "postgres_password" {
  value       = var.postgres_password
  sensitive   = true
  description = "PostgreSQL password (sensitive)"
}

output "redis_host" {
  value       = aws_elasticache_cluster.redis.cache_nodes[0].address
  description = "Redis host address"
}

########################
# SSM Command Outputs
########################

output "ansible_ssm_command" {
  value       = "aws ssm start-session --target ${aws_instance.ansible_instance.id} --region ${var.aws_region}"
  description = "SSM command to connect to the Ansible host"
}

output "nbc_ssm_command" {
  value       = "aws ssm start-session --target ${aws_instance.nbc_instance.id} --region ${var.aws_region}"
  description = "SSM command to connect to the NetBox Community instance"
}

output "nbe_ssm_command" {
  value       = "aws ssm start-session --target ${aws_instance.nbe_instance.id} --region ${var.aws_region}"
  description = "SSM command to connect to the NetBox Enterprise instance"
}

output "orb_ssm_command" {
  value       = "aws ssm start-session --target ${aws_instance.orb_instance.id} --region ${var.aws_region}"
  description = "SSM command to connect to the ORB host"
}
