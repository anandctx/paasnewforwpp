

resource "azurerm_windows_web_app" "asewindows" {
 for_each = {for a in local.ase1 : a.asename =>a }

  name                = each.value.asename
  resource_group_name = "ibo-rg"
  location            = local.location
  service_plan_id     = each.value.service_plan_id

  site_config {
    always_on = false
  }
}
