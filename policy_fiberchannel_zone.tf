resource "intersight_fabric_fc_zone_policy" "hitachi-a" {
  name = "hitachi-a"
  tags = [local.terraform]
  organization {
    moid = local.organization
  }
  
    fc_target_zoning_type = "SIMT"
    fc_target_members = [ {
      name = "hitachi-cl1a"
      additional_properties = ""
      class_id = ""
      object_type = ""
      switch_id = "A"
      vsan_id = 101
      wwpn = "50:06:0e:80:21:a2:80:00"
    } ]
}

resource "intersight_fabric_fc_zone_policy" "hitachi-b" {
  name = "hitachi-b"
  tags = [local.terraform]
  organization {
    moid = local.organization
  }
  
    fc_target_zoning_type = "SIMT"
    fc_target_members = [ {
      name = "hitachi-cl2a"
      additional_properties = ""
      class_id = ""
      object_type = ""
      switch_id = "B"
      vsan_id = 102
      wwpn = "50:06:0e:80:21:a2:80:10"
    } ]
}