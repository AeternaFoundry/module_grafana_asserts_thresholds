output "asserts_thresholds_id" {
  description = "Map of id values across all asserts_thresholds, keyed the same as var.asserts_thresholds except keys with no id are omitted"
  value       = { for k, v in grafana_asserts_thresholds.asserts_thresholds : k => v.id if v.id != null && length(v.id) > 0 }
}
output "asserts_thresholds_health_thresholds" {
  description = "Map of health_thresholds values across all asserts_thresholds, keyed the same as var.asserts_thresholds except keys with no health_thresholds are omitted"
  value       = { for k, v in grafana_asserts_thresholds.asserts_thresholds : k => v.health_thresholds if v.health_thresholds != null && length(v.health_thresholds) > 0 }
}
output "asserts_thresholds_request_thresholds" {
  description = "Map of request_thresholds values across all asserts_thresholds, keyed the same as var.asserts_thresholds except keys with no request_thresholds are omitted"
  value       = { for k, v in grafana_asserts_thresholds.asserts_thresholds : k => v.request_thresholds if v.request_thresholds != null && length(v.request_thresholds) > 0 }
}
output "asserts_thresholds_resource_thresholds" {
  description = "Map of resource_thresholds values across all asserts_thresholds, keyed the same as var.asserts_thresholds except keys with no resource_thresholds are omitted"
  value       = { for k, v in grafana_asserts_thresholds.asserts_thresholds : k => v.resource_thresholds if v.resource_thresholds != null && length(v.resource_thresholds) > 0 }
}

