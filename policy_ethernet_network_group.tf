resource "intersight_fabric_eth_network_group_policy" "nxos" {
  name = "nxos"
  tags = [local.terraform]
  organization {
    moid = local.organization
  }

  vlan_settings {
    native_vlan   = 1
    allowed_vlans = format("%s", join(",", [for e in var.network_map_infra : e.vlan]))
  }
}

resource "intersight_fabric_eth_network_group_policy" "aci" {
  name = "aci"
  tags = [local.terraform]
  organization {
    moid = local.organization
  }

  vlan_settings {
    native_vlan = 1
    allowed_vlans = format("%s", join(",", [for e in var.network_map_vmnetwork : e.vlan]))
  }
}