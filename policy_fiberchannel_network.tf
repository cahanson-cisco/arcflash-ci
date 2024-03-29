resource "intersight_vnic_fc_network_policy" "vsan101" {
  name = "vsan101"
  tags = [local.terraform]
  organization {
    moid = local.organization
  }

  vsan_settings {
    id = 101
  }
}

resource "intersight_vnic_fc_network_policy" "vsan102" {
  name = "vsan102"
  tags = [local.terraform]
  organization {
    moid = local.organization
  }

  vsan_settings {
    id = 102
  }
}