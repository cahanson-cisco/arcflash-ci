resource "intersight_fabric_switch_cluster_profile" "default-6454" {
  name = "default-6454"
  tags = [local.terraform]
  organization {
    moid = local.organization
  }

  type = "instance"
}

resource "intersight_fabric_switch_profile" "default-6454-A" {
  name = "default-6454-A"
  tags = [local.terraform]

  type = "instance"

  switch_cluster_profile {
    moid = intersight_fabric_switch_cluster_profile.default-6454.moid
  }
}

resource "intersight_fabric_switch_profile" "default-6454-B" {
  name = "default-6454-B"
  tags = [local.terraform]

  type = "instance"

  switch_cluster_profile {
    moid = intersight_fabric_switch_cluster_profile.default-6454.moid
  }
}