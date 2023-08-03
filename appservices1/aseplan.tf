resource "azurerm_service_plan" "asplan" {

    for_each = {for a in local.ase1 : a.aseplanname =>a if a.newplanname !=null}
  name                = each.value.aseplanname
  resource_group_name = "ibo-rg"
  location            = local.location
  sku_name            = each.value.skuname
  os_type             = each.value.ostype
}