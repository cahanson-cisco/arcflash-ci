variable "qos_map" {
  type = map(object({
    mtu   = number
    cos   = number
    class = string
  }))
  default = {
    be = {
      mtu   = 9000
      cos   = 0
      class = "Best Effort"
    }
  }
}

resource "intersight_vnic_eth_qos_policy" "default" {
  for_each = var.qos_map

  name = each.key
  tags = [local.terraform]
  organization {
    moid = local.organization
  }

  mtu            = each.value.mtu
  rate_limit     = 0
  cos            = each.value.cos
  burst          = 10240
  priority       = each.value.class
  trust_host_cos = false
}