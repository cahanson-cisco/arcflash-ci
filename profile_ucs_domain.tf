resource "intersight_fabric_switch_cluster_profile" "default-6454" {
  name = "default-6454"
  tags = [local.terraform]
  organization {
    moid = local.organization
  }

  type = "instance"
}

resource "intersight_fabric_switch_profile" "default-6454" {
  for_each = toset(["A", "B"])

  name = "default-6454-${each.key}"
  tags = [local.terraform]

  type = "instance"

  switch_cluster_profile {
    moid = intersight_fabric_switch_cluster_profile.default-6454.moid
  }
}