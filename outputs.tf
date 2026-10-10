output "finspace_kx_environments_id" {
  description = "Map of id values across all finspace_kx_environments, keyed the same as var.finspace_kx_environments"
  value       = { for k, v in aws_finspace_kx_environment.finspace_kx_environments : k => v.id if v.id != null && length(v.id) > 0 }
}
output "finspace_kx_environments_arn" {
  description = "Map of arn values across all finspace_kx_environments, keyed the same as var.finspace_kx_environments"
  value       = { for k, v in aws_finspace_kx_environment.finspace_kx_environments : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "finspace_kx_environments_availability_zones" {
  description = "Map of availability_zones values across all finspace_kx_environments, keyed the same as var.finspace_kx_environments"
  value       = { for k, v in aws_finspace_kx_environment.finspace_kx_environments : k => v.availability_zones if v.availability_zones != null && length(v.availability_zones) > 0 }
}
output "finspace_kx_environments_created_timestamp" {
  description = "Map of created_timestamp values across all finspace_kx_environments, keyed the same as var.finspace_kx_environments"
  value       = { for k, v in aws_finspace_kx_environment.finspace_kx_environments : k => v.created_timestamp if v.created_timestamp != null && length(v.created_timestamp) > 0 }
}
output "finspace_kx_environments_custom_dns_configuration" {
  description = "Map of custom_dns_configuration values across all finspace_kx_environments, keyed the same as var.finspace_kx_environments"
  value       = { for k, v in aws_finspace_kx_environment.finspace_kx_environments : k => v.custom_dns_configuration if v.custom_dns_configuration != null && length(v.custom_dns_configuration) > 0 }
}
output "finspace_kx_environments_description" {
  description = "Map of description values across all finspace_kx_environments, keyed the same as var.finspace_kx_environments"
  value       = { for k, v in aws_finspace_kx_environment.finspace_kx_environments : k => v.description if v.description != null && length(v.description) > 0 }
}
output "finspace_kx_environments_infrastructure_account_id" {
  description = "Map of infrastructure_account_id values across all finspace_kx_environments, keyed the same as var.finspace_kx_environments"
  value       = { for k, v in aws_finspace_kx_environment.finspace_kx_environments : k => v.infrastructure_account_id if v.infrastructure_account_id != null && length(v.infrastructure_account_id) > 0 }
}
output "finspace_kx_environments_kms_key_id" {
  description = "Map of kms_key_id values across all finspace_kx_environments, keyed the same as var.finspace_kx_environments"
  value       = { for k, v in aws_finspace_kx_environment.finspace_kx_environments : k => v.kms_key_id if v.kms_key_id != null && length(v.kms_key_id) > 0 }
}
output "finspace_kx_environments_last_modified_timestamp" {
  description = "Map of last_modified_timestamp values across all finspace_kx_environments, keyed the same as var.finspace_kx_environments"
  value       = { for k, v in aws_finspace_kx_environment.finspace_kx_environments : k => v.last_modified_timestamp if v.last_modified_timestamp != null && length(v.last_modified_timestamp) > 0 }
}
output "finspace_kx_environments_name" {
  description = "Map of name values across all finspace_kx_environments, keyed the same as var.finspace_kx_environments"
  value       = { for k, v in aws_finspace_kx_environment.finspace_kx_environments : k => v.name if v.name != null && length(v.name) > 0 }
}
output "finspace_kx_environments_region" {
  description = "Map of region values across all finspace_kx_environments, keyed the same as var.finspace_kx_environments"
  value       = { for k, v in aws_finspace_kx_environment.finspace_kx_environments : k => v.region if v.region != null && length(v.region) > 0 }
}
output "finspace_kx_environments_status" {
  description = "Map of status values across all finspace_kx_environments, keyed the same as var.finspace_kx_environments"
  value       = { for k, v in aws_finspace_kx_environment.finspace_kx_environments : k => v.status if v.status != null && length(v.status) > 0 }
}
output "finspace_kx_environments_tags" {
  description = "Map of tags values across all finspace_kx_environments, keyed the same as var.finspace_kx_environments"
  value       = { for k, v in aws_finspace_kx_environment.finspace_kx_environments : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "finspace_kx_environments_tags_all" {
  description = "Map of tags_all values across all finspace_kx_environments, keyed the same as var.finspace_kx_environments"
  value       = { for k, v in aws_finspace_kx_environment.finspace_kx_environments : k => v.tags_all if v.tags_all != null && length(v.tags_all) > 0 }
}
output "finspace_kx_environments_transit_gateway_configuration" {
  description = "Map of transit_gateway_configuration values across all finspace_kx_environments, keyed the same as var.finspace_kx_environments"
  value       = { for k, v in aws_finspace_kx_environment.finspace_kx_environments : k => one(v.transit_gateway_configuration) if v.transit_gateway_configuration != null && length(v.transit_gateway_configuration) > 0 }
}

