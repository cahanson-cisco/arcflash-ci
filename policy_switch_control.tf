resource "intersight_fabric_switch_control_policy" "direct-attached" {
  name = "direct-attached"
  tags = [local.terraform]
  organization {
    moid = local.organization
  }
    fc_switching_mode = "switch"
    profiles {
      moid        = intersight_fabric_switch_profile.default-6454-A.moid
      object_type = intersight_fabric_switch_profile.default-6454-A.object_type
    }
    profiles {
      moid        = intersight_fabric_switch_profile.default-6454-B.moid
      object_type = intersight_fabric_switch_profile.default-6454-B.object_type
    }
}