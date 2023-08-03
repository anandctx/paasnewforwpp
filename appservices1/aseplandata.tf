data "azurerm_service_plan" "asplandata" {
    for_each = {for a in local.asedata : a.existplanname =>a if a.existplanname !=null}
  name                = try(each.value.existingplanname, null)
  resource_group_name = "ibo-rg"
}
