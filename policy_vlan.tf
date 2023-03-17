# This resource holds the configured VLANs for the Fabric Interconnect.
resource "intersight_fabric_eth_network_policy" "default" {
  name = "default"
  tags = [local.terraform]
  organization {
    moid = local.organization
  }

  profiles {
      moid        = intersight_fabric_switch_profile.default-6454-A.moid
      object_type = intersight_fabric_switch_profile.default-6454-A.object_type
    }
  profiles {
      moid        = intersight_fabric_switch_profile.default-6454-B.moid
      object_type = intersight_fabric_switch_profile.default-6454-B.object_type
    }

}


resource "intersight_fabric_vlan" "vlans_infra" {
  for_each = var.network_map_infra

  name = each.key
  tags = [local.terraform]


  auto_allow_on_uplinks = true
  is_native             = false
  vlan_id               = each.value.vlan

  eth_network_policy {
    moid = intersight_fabric_eth_network_policy.default.moid
  }

  multicast_policy {
    moid = intersight_fabric_multicast_policy.default.moid
  }

}

resource "intersight_fabric_vlan" "vlans_vmnetwork" {
  for_each = var.network_map_vmnetwork

  name = each.key
  tags = [local.terraform]

  auto_allow_on_uplinks = true
  is_native             = false
  vlan_id               = each.value.vlan

  eth_network_policy {
    moid = intersight_fabric_eth_network_policy.default.moid
  }

  multicast_policy {
    moid = intersight_fabric_multicast_policy.default.moid
  }

}