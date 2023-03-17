resource "intersight_networkconfig_policy" "default" {
  name = "default"
  tags = [local.terraform]
  organization {
    moid = local.organization
  }

  enable_dynamic_dns = false

  # ipv4
  enable_ipv4dns_from_dhcp = false
  preferred_ipv4dns_server = "10.0.10.22"
  alternate_ipv4dns_server = "10.0.10.23"

  # ipv6
  enable_ipv6              = false
  enable_ipv6dns_from_dhcp = false

}