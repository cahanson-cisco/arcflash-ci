resource "intersight_fabric_fc_network_policy" "default-A" {
  name = "default-A"
  tags = [local.terraform]
  organization {
    moid = local.organization
  }

  enable_trunking = false

  # This is a temporary workaround to the bug in intersight_fabric_switch_profile policy_bucket
  # we are attaching the profile to the policy here instead of attaching the policy to the profile in profile_ucs_domain.tf
  profiles {
      moid        = intersight_fabric_switch_profile.default-6454-A.moid
      object_type = intersight_fabric_switch_profile.default-6454-A.object_type
    }

}

resource "intersight_fabric_vsan" "vsan101" {
  name = "vsan101"
  tags = [local.terraform]

  default_zoning = "Enabled"
  vsan_scope     = "Storage"
  fcoe_vlan      = 101
  vsan_id        = 101

  fc_network_policy {
    moid = intersight_fabric_fc_network_policy.default-A.moid
  }

}

resource "intersight_fabric_fc_network_policy" "default-B" {
  name = "default-B"
  tags = [local.terraform]
  organization {
    moid = local.organization
  }

  enable_trunking = false

  profiles {
      moid        = intersight_fabric_switch_profile.default-6454-B.moid
      object_type = intersight_fabric_switch_profile.default-6454-B.object_type
    }

}

resource "intersight_fabric_vsan" "vsan102" {
  name = "vsan102"
  tags = [local.terraform]

  default_zoning = "Enabled"
  vsan_scope     = "Storage"
  fcoe_vlan      = 102
  vsan_id        = 102

  fc_network_policy {
    moid = intersight_fabric_fc_network_policy.default-B.moid
  }

}