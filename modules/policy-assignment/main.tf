resource "azurerm_subscription_policy_assignment" "this" {
  name                 = var.name
  display_name         = var.display_name
  policy_definition_id = var.policy_definition_id
  subscription_id      = "/subscriptions/${var.subscription_id}"
  location             = var.location
}