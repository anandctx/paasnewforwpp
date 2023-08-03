locals {
  ase1 = flatten([

    for a, b in var.ase1 : {

      asename = "${b.asename}-${local.location}-${b.aseinstancenumber}" 
      
      aseplanname =try("${b.newplanname}-${local.location}-aseplan-${b.skuname}", null)
      newplanname =try(b.newplanname, null)
      skuname = try(b.skuname, null)
      ostype = try(b.ostype,null)
    #   existingplanname = try("${b.existplanname}-${local.location}-aseplan-${b.skuname}", null)
      service_plan_id     = try("/subscriptions/6e54aa79-9b0b-40ed-ae27-91fdffa0a565/resourceGroups/ibo-rg/providers/Microsoft.Web/serverfarms/${b.newplanname}-${local.location}-aseplan-${b.skuname}", data.azurerm_service_plan.asplandata[b.existplanname].id)

    #   service_plan_id =try(data.azurerm_service_plan.asplandata[b.existplanname].id, null)

      
      
      
       }])
       location = var.location

asedata = flatten([

    for a, b in var.ase1 : {

      existingplanname = try("${b.existplanname}-${local.location}-aseplan-${b.skuname}", null)
      existplanname = try(b.existplanname, null)
}])




      
}