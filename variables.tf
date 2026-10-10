variable "finspace_kx_environments" {
  description = <<EOT
Map of finspace_kx_environments, attributes below
Required:
    - kms_key_id
    - name
Optional:
    - description
    - region
    - tags
    - tags_all
    - custom_dns_configuration (block):
        - custom_dns_server_ip (required)
        - custom_dns_server_name (required)
    - transit_gateway_configuration (block):
        - attachment_network_acl_configuration (optional, block):
            - cidr_block (required)
            - icmp_type_code (optional, block):
                - code (required)
                - type (required)
            - port_range (optional, block):
                - from (required)
                - to (required)
            - protocol (required)
            - rule_action (required)
            - rule_number (required)
        - routable_cidr_space (required)
        - transit_gateway_id (required)
EOT

  type = map(object({
    kms_key_id  = string
    name        = string
    description = optional(string)
    region      = optional(string)
    tags        = optional(map(string))
    tags_all    = optional(map(string))
    custom_dns_configuration = optional(list(object({
      custom_dns_server_ip   = string
      custom_dns_server_name = string
    })))
    transit_gateway_configuration = optional(object({
      attachment_network_acl_configuration = optional(list(object({
        cidr_block = string
        icmp_type_code = optional(object({
          code = number
          type = number
        }))
        port_range = optional(object({
          from = number
          to   = number
        }))
        protocol    = string
        rule_action = string
        rule_number = number
      })))
      routable_cidr_space = string
      transit_gateway_id  = string
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.finspace_kx_environments : (
        v.transit_gateway_configuration == null || (v.transit_gateway_configuration.attachment_network_acl_configuration == null || (length(v.transit_gateway_configuration.attachment_network_acl_configuration) <= 100))
      )
    ])
    error_message = "Each attachment_network_acl_configuration list must contain at most 100 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.finspace_kx_environments : (
        v.custom_dns_configuration == null || alltrue([for item in v.custom_dns_configuration : (length(item.custom_dns_server_name) >= 3 && length(item.custom_dns_server_name) <= 255)])
      )
    ])
    error_message = "must be between 3 and 255 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.finspace_kx_environments : (
        v.transit_gateway_configuration == null || (v.transit_gateway_configuration.attachment_network_acl_configuration == null || alltrue([for item in v.transit_gateway_configuration.attachment_network_acl_configuration : (item.port_range == null || (item.port_range.from >= 1 && item.port_range.from <= 65535))]))
      )
    ])
    error_message = "must be a valid port number (1-65535)"
  }
  validation {
    condition = alltrue([
      for k, v in var.finspace_kx_environments : (
        v.transit_gateway_configuration == null || (v.transit_gateway_configuration.attachment_network_acl_configuration == null || alltrue([for item in v.transit_gateway_configuration.attachment_network_acl_configuration : (item.port_range == null || (item.port_range.to >= 1 && item.port_range.to <= 65535))]))
      )
    ])
    error_message = "must be a valid port number (1-65535)"
  }
  validation {
    condition = alltrue([
      for k, v in var.finspace_kx_environments : (
        v.transit_gateway_configuration == null || (v.transit_gateway_configuration.attachment_network_acl_configuration == null || alltrue([for item in v.transit_gateway_configuration.attachment_network_acl_configuration : (item.rule_number >= 1 && item.rule_number <= 32766)]))
      )
    ])
    error_message = "must be between 1 and 32766"
  }
  # Note: 9 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

