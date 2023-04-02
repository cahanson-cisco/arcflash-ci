resource "intersight_vmedia_policy" "vmedia_enabled" {
  name = "vmedia_enabled"
  tags = [local.terraform]
  organization {
    moid = local.organization
  }

  enabled       = true
  encryption    = true
  low_power_usb = true
}