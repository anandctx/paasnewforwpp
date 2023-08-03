module "appservice" {
    source = "./appservices1"
    for_each = var.asemain
    location = each.key
    ase1 = each.value

    
}