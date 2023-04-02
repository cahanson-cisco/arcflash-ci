resource "intersight_macpool_pool" "arcflash_mac_a" {
  name = "arcflash_mac_a"
  tags = [local.terraform]
  organization {
    moid = local.organization
  }

  mac_blocks {
    from = "00:25:b5:af:fa:01"
    size = 255
  }

  lifecycle {
    ignore_changes = [mac_blocks]
  }
}

resource "intersight_macpool_pool" "arcflash_mac_b" {
  name = "arcflash_mac_b"
  tags = [local.terraform]
  organization {
    moid = local.organization
  }
  
  mac_blocks {
    from = "00:25:b5:af:fb:01"
    size = 255
  }

  lifecycle {
    ignore_changes = [mac_blocks]
  }
}