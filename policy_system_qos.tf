resource "intersight_fabric_system_qos_policy" "default" {
  name = "default"
  tags = [local.terraform]
  organization {
    moid = local.organization
  }

  classes {
    admin_state        = "Enabled"
    bandwidth_percent  = 6
    cos                = 1
    mtu                = 9000
    multicast_optimize = false
    name               = "Bronze"
    packet_drop        = true
    weight             = 1
  }

  classes {
    admin_state        = "Enabled"
    bandwidth_percent  = 6
    cos                = 2
    mtu                = 1500
    multicast_optimize = true
    name               = "Silver"
    packet_drop        = true
    weight             = 1
  }

  classes {
    admin_state        = "Enabled"
    bandwidth_percent  = 25
    cos                = 4
    mtu                = 1500
    multicast_optimize = false
    name               = "Gold"
    packet_drop        = true
    weight             = 4
  }

  classes {
    admin_state        = "Enabled"
    bandwidth_percent  = 25
    cos                = 5
    mtu                = 1500
    multicast_optimize = false
    name               = "Platinum"
    packet_drop        = false
    weight             = 4
  }

  classes {
    admin_state        = "Enabled"
    bandwidth_percent  = 6
    cos                = 255
    mtu                = 1500
    multicast_optimize = false
    name               = "Best Effort"
    packet_drop        = true
    weight             = 1
  }

  classes {
    admin_state        = "Enabled"
    bandwidth_percent  = 32
    cos                = 3
    mtu                = 2240
    multicast_optimize = false
    name               = "FC"
    packet_drop        = false
    weight             = 5
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