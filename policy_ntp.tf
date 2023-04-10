resource "intersight_ntp_policy" "default" {
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

  enabled  = true
  ntp_servers = [
    "10.0.0.252",
    "10.0.0.253",
  ]
  timezone = "Etc/GMT"
}