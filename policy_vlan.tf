# This resource holds the configured VLANs for the Fabric Interconnect.
resource "intersight_fabric_eth_network_policy" "default" {
  name = "default"
  tags = [local.terraform]
  organization {
    moid = local.organization
  }

    dynamic "profiles" {
    for_each = intersight_fabric_switch_profile.default-6454
    content {
      moid        = profiles.value.moid
      object_type = profiles.value.object_type
    }
  }
}


resource "intersight_fabric_vlan" "vlans_infra" {
  for_each = var.network_map_infra

  name = each.key
  tags = [local.terraform]


  auto_allow_on_uplinks = false
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

  auto_allow_on_uplinks = false
  is_native             = false
  vlan_id               = each.value.vlan

  eth_network_policy {
    moid = intersight_fabric_eth_network_policy.default.moid
  }

  multicast_policy {
    moid = intersight_fabric_multicast_policy.default.moid
  }

}