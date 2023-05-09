resource "intersight_fabric_port_policy" "default-6536-A" {
  name = "default-6536-A"
  tags = [local.terraform]
  organization {
    moid = local.organization
  }

  device_model = "UCS-FI-6536"
  profiles {
    moid        = intersight_fabric_switch_profile.default-6536-A.moid
    object_type = intersight_fabric_switch_profile.default-6536-A.object_type
  }
}

resource "intersight_fabric_port_policy" "default-6536-B" {
  name = "default-6536-B"
  tags = [local.terraform]
  organization {
    moid = local.organization
  }

  device_model = "UCS-FI-6536"
  profiles {
    moid        = intersight_fabric_switch_profile.default-6536-B.moid
    object_type = intersight_fabric_switch_profile.default-6536-B.object_type
  }
}


### FABRIC A Configuration


resource "intersight_fabric_port_mode" "fibrechannel_ports-A" {
  custom_mode   = "BreakoutFibreChannel32G"
  port_id_start = 35
  port_id_end   = 36
  slot_id       = 1

  port_policy {
    moid = intersight_fabric_port_policy.default-6536-A.moid
  }
}

resource "intersight_fabric_fc_storage_role" "fc_storage-breakout-A1" {
  admin_speed  = "32Gbps"
  vsan_id      = 101
  slot_id      = 1
  port_id      = 1

  for_each = toset([for p in range(35, 36 + 1) : tostring(p)])

  aggregate_port_id = each.value

  port_policy {
    moid = intersight_fabric_port_policy.default-6536-A.moid
  }
}

resource "intersight_fabric_fc_storage_role" "fc_storage-breakout-A2" {
  admin_speed  = "32Gbps"
  vsan_id      = 101
  slot_id      = 1
  port_id      = 2

  for_each = toset([for p in range(35, 36 + 1) : tostring(p)])

  aggregate_port_id = each.value

  port_policy {
    moid = intersight_fabric_port_policy.default-6536-A.moid
  }
}
resource "intersight_fabric_fc_storage_role" "fc_storage-breakout-A3" {
  admin_speed  = "32Gbps"
  vsan_id      = 101
  slot_id      = 1
  port_id      = 3

  for_each = toset([for p in range(35, 36 + 1) : tostring(p)])

  aggregate_port_id = each.value

  port_policy {
    moid = intersight_fabric_port_policy.default-6536-A.moid
  }
}
resource "intersight_fabric_fc_storage_role" "fc_storage-breakout-A4" {
  admin_speed  = "32Gbps"
  vsan_id      = 101
  slot_id      = 1
  port_id      = 4

  for_each = toset([for p in range(35, 36 + 1) : tostring(p)])

  aggregate_port_id = each.value

  port_policy {
    moid = intersight_fabric_port_policy.default-6536-A.moid
  }
}

resource "intersight_fabric_server_role" "server_ports-A" {
  for_each = toset([for p in range(1, 30 + 1) : tostring(p)])

  port_id = each.value
  slot_id = 1

  port_policy {
    moid = intersight_fabric_port_policy.default-6536-A.moid
  }
}

resource "intersight_fabric_uplink_pc_role" "ethernet_pc_uplink-A" {
  admin_speed = "Auto"
  pc_id       = 1

  dynamic "ports" {
    for_each = toset([for p in range(31, 32 + 1) : tostring(p)])
    content {
      port_id = ports.value
      slot_id = 1
    }
  }

  port_policy {
    moid = intersight_fabric_port_policy.default-6536-A.moid
  }
}



### FABRIC B Configuration


resource "intersight_fabric_port_mode" "fibrechannel_ports-B" {
  custom_mode   = "BreakoutFibreChannel32G"
  port_id_start = 35
  port_id_end   = 36
  slot_id       = 1

  port_policy {
    moid = intersight_fabric_port_policy.default-6536-B.moid
  }
}

resource "intersight_fabric_fc_storage_role" "fc_storage-breakout-B1" {
  admin_speed  = "32Gbps"
  vsan_id      = 102
  slot_id      = 1
  port_id      = 1

  for_each = toset([for p in range(35, 36 + 1) : tostring(p)])

  aggregate_port_id = each.value

  port_policy {
    moid = intersight_fabric_port_policy.default-6536-B.moid
  }
}

resource "intersight_fabric_fc_storage_role" "fc_storage-breakout-B2" {
  admin_speed  = "32Gbps"
  vsan_id      = 102
  slot_id      = 1
  port_id      = 2

  for_each = toset([for p in range(35, 36 + 1) : tostring(p)])

  aggregate_port_id = each.value

  port_policy {
    moid = intersight_fabric_port_policy.default-6536-B.moid
  }
}
resource "intersight_fabric_fc_storage_role" "fc_storage-breakout-B3" {
  admin_speed  = "32Gbps"
  vsan_id      = 102
  slot_id      = 1
  port_id      = 3

  for_each = toset([for p in range(35, 36 + 1) : tostring(p)])

  aggregate_port_id = each.value

  port_policy {
    moid = intersight_fabric_port_policy.default-6536-B.moid
  }
}
resource "intersight_fabric_fc_storage_role" "fc_storage-breakout-B4" {
  admin_speed  = "32Gbps"
  vsan_id      = 102
  slot_id      = 1
  port_id      = 4

  for_each = toset([for p in range(35, 36 + 1) : tostring(p)])

  aggregate_port_id = each.value

  port_policy {
    moid = intersight_fabric_port_policy.default-6536-B.moid
  }
}

resource "intersight_fabric_server_role" "server_ports-B" {
  for_each = toset([for p in range(1, 30 + 1) : tostring(p)])

  port_id = each.value
  slot_id = 1

  port_policy {
    moid = intersight_fabric_port_policy.default-6536-B.moid
  }
}

resource "intersight_fabric_uplink_pc_role" "ethernet_pc_uplink-B" {
  admin_speed = "Auto"
  pc_id       = 1

  dynamic "ports" {
    for_each = toset([for p in range(31, 32 + 1) : tostring(p)])
    content {
      port_id = ports.value
      slot_id = 1
    }
  }

  port_policy {
    moid = intersight_fabric_port_policy.default-6536-B.moid
  }
}