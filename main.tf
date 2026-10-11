resource "grafana_asserts_thresholds" "asserts_thresholds" {
  for_each = var.asserts_thresholds


  dynamic "health_thresholds" {
    for_each = each.value.health_thresholds != null ? each.value.health_thresholds : []
    content {
      alert_category = health_thresholds.value.alert_category
      assertion_name = health_thresholds.value.assertion_name
      entity_type    = health_thresholds.value.entity_type
      expression     = health_thresholds.value.expression
    }
  }

  dynamic "request_thresholds" {
    for_each = each.value.request_thresholds != null ? each.value.request_thresholds : []
    content {
      assertion_name  = request_thresholds.value.assertion_name
      entity_name     = request_thresholds.value.entity_name
      request_context = request_thresholds.value.request_context
      request_type    = request_thresholds.value.request_type
      value           = request_thresholds.value.value
    }
  }

  dynamic "resource_thresholds" {
    for_each = each.value.resource_thresholds != null ? each.value.resource_thresholds : []
    content {
      assertion_name = resource_thresholds.value.assertion_name
      container_name = resource_thresholds.value.container_name
      resource_type  = resource_thresholds.value.resource_type
      severity       = resource_thresholds.value.severity
      source         = resource_thresholds.value.source
      value          = resource_thresholds.value.value
    }
  }
}

