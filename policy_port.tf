resource "intersight_fabric_port_policy" "default-6454" {
  name = "default-6454"
  tags = [local.terraform]
  organization {
    moid = local.organization
  }

  device_model = "UCS-FI-6454"

  dynamic "profiles" {
    for_each = intersight_fabric_switch_profile.default-6454
    content {
      moid        = profiles.value.moid
      object_type = profiles.value.object_type
    }
  }
}


resource "intersight_fabric_server_role" "server_ports" {
  for_each = toset([for p in range(1, 16 + 1) : tostring(p)])

  port_id = each.value
  slot_id = 1

  port_policy {
    moid = intersight_fabric_port_policy.default-6454.moid
  }

}

resource "intersight_fabric_uplink_pc_role" "ethernet_pc_uplink-aci" {
  admin_speed = "Auto"
  pc_id       = 1

  port_policy {
    moid = intersight_fabric_port_policy.default-6454.moid
  }

  dynamic "ports" {
    for_each = toset([for p in range(49, 50 + 1) : tostring(p)])
    content {
      port_id = ports.value
      slot_id = 1
    }
  }

  eth_network_group_policy {
    moid = intersight_fabric_eth_network_group_policy.aci.moid
  }
}

resource "intersight_fabric_uplink_pc_role" "ethernet_pc_uplink-nxos" {
  admin_speed = "Auto"
  pc_id       = 2

  port_policy {
    moid = intersight_fabric_port_policy.default-6454.moid
  }

  dynamic "ports" {
    for_each = toset([for p in range(47, 48 + 1) : tostring(p)])
    content {
      port_id = ports.value
      slot_id = 1
    }
  }

  eth_network_group_policy {
    moid = intersight_fabric_eth_network_group_policy.nxos.moid
  }

}