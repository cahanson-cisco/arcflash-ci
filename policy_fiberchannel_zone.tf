resource "intersight_fabric_fc_zone_policy" "flashstack-a" {
  name = "flashstack-a"
  tags = [local.terraform]
  organization {
    moid = local.organization
  }
  
    fc_target_zoning_type = "SIMT"
    fc_target_members = [ {
      name = "purect0fc0"
      additional_properties = ""
      class_id = ""
      object_type = ""
      switch_id = "A"
      vsan_id = 101
      wwpn = "52:4A:93:71:20:FF:59:00"
    },
    {
      name = "purect0fc1"
      additional_properties = ""
      class_id = ""
      object_type = ""
      switch_id = "A"
      vsan_id = 101
      wwpn = "52:4A:93:71:20:FF:59:01"
    } ]
}

resource "intersight_fabric_fc_zone_policy" "flashstack-b" {
  name = "flashstack-b"
  tags = [local.terraform]
  organization {
    moid = local.organization
  }
  
    fc_target_zoning_type = "SIMT"
    fc_target_members = [ {
      name = "purect1fc0"
      additional_properties = ""
      class_id = ""
      object_type = ""
      switch_id = "B"
      vsan_id = 102
      wwpn = "52:4A:93:71:20:FF:59:10"
    },{
      name = "purect1fc1"
      additional_properties = ""
      class_id = ""
      object_type = ""
      switch_id = "B"
      vsan_id = 102
      wwpn = "52:4A:93:71:20:FF:59:11"
    } ]
}