variable "asserts_thresholds" {
  description = <<EOT
Map of asserts_thresholds, attributes below
Optional:
    - health_thresholds (block):
        - alert_category (optional)
        - assertion_name (required)
        - entity_type (required)
        - expression (required)
    - request_thresholds (block):
        - assertion_name (required)
        - entity_name (required)
        - request_context (required)
        - request_type (required)
        - value (required)
    - resource_thresholds (block):
        - assertion_name (required)
        - container_name (required)
        - resource_type (required)
        - severity (required)
        - source (required)
        - value (required)
EOT

  type = map(object({
    health_thresholds = optional(list(object({
      alert_category = optional(string)
      assertion_name = string
      entity_type    = string
      expression     = string
    })))
    request_thresholds = optional(list(object({
      assertion_name  = string
      entity_name     = string
      request_context = string
      request_type    = string
      value           = number
    })))
    resource_thresholds = optional(list(object({
      assertion_name = string
      container_name = string
      resource_type  = string
      severity       = string
      source         = string
      value          = number
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.asserts_thresholds : (
        v.request_thresholds == null || alltrue([for item in v.request_thresholds : (contains(["RequestRateAnomaly", "ErrorRatioAnomaly", "ErrorRatioBreach", "ErrorBuildup", "InboundClientErrorAnomaly", "ErrorLogRateBreach", "LatencyAverageAnomaly", "LatencyAverageBreach", "LatencyP99ErrorBuildup", "LoggerRateAnomaly"], item.assertion_name))])
      )
    ])
    error_message = "must be one of: \"RequestRateAnomaly\", \"ErrorRatioAnomaly\", \"ErrorRatioBreach\", \"ErrorBuildup\", \"InboundClientErrorAnomaly\", \"ErrorLogRateBreach\", \"LatencyAverageAnomaly\", \"LatencyAverageBreach\", \"LatencyP99ErrorBuildup\", \"LoggerRateAnomaly\""
  }
  validation {
    condition = alltrue([
      for k, v in var.asserts_thresholds : (
        v.resource_thresholds == null || alltrue([for item in v.resource_thresholds : (contains(["Saturation", "ResourceRateBreach", "ResourceMayExhaust", "ResourceRateAnomaly"], item.assertion_name))])
      )
    ])
    error_message = "must be one of: \"Saturation\", \"ResourceRateBreach\", \"ResourceMayExhaust\", \"ResourceRateAnomaly\""
  }
  validation {
    condition = alltrue([
      for k, v in var.asserts_thresholds : (
        v.resource_thresholds == null || alltrue([for item in v.resource_thresholds : (contains(["warning", "critical"], item.severity))])
      )
    ])
    error_message = "must be one of: \"warning\", \"critical\""
  }
}

