resource "intersight_ntp_policy" "default" {
  name = "default"
  tags = [local.terraform]
  organization {
    moid = local.organization
  }

  enabled  = true
  ntp_servers = [
    "10.0.0.252",
    "10.0.0.253",
  ]
  timezone = "Etc/GMT"

  profiles {
      moid        = intersight_fabric_switch_profile.default-6454-A.moid
      object_type = intersight_fabric_switch_profile.default-6454-A.object_type
    }
  profiles {
      moid        = intersight_fabric_switch_profile.default-6454-B.moid
      object_type = intersight_fabric_switch_profile.default-6454-B.object_type
    }

}