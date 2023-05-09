resource "intersight_fabric_switch_cluster_profile" "default-6536" {
  name = "default-6536"
  tags = [local.terraform]
  organization {
    moid = local.organization
  }

  type = "instance"
}

resource "intersight_fabric_switch_profile" "default-6536-A" {
  name = "default-6536-A"
  tags = [local.terraform]

  type = "instance"

  switch_cluster_profile {
    moid = intersight_fabric_switch_cluster_profile.default-6536.moid
  }
}

resource "intersight_fabric_switch_profile" "default-6536-B" {
  name = "default-6356-B"
  tags = [local.terraform]

  type = "instance"

  switch_cluster_profile {
    moid = intersight_fabric_switch_cluster_profile.default-6536.moid
  }
}