resource "intersight_fcpool_pool" "arcflash_wwnn" {
  name = "arcflash_wwnn"
  tags = [local.terraform]
  organization {
    moid = local.organization
  }

  pool_purpose = "WWNN"

  id_blocks {
    from = "20:00:00:25:b5:af:20:01"
    size = 255
  }

  lifecycle {
    ignore_changes = [id_blocks]
  }
}

resource "intersight_fcpool_pool" "arcflash_wwpn_a" {
  name = "arcflash_wwpn_a"
  tags = [local.terraform]
  organization {
    moid = local.organization
  }

  pool_purpose = "WWPN"

  id_blocks {
    from = "20:00:00:25:af:fa:00:01"
    size = 255
  }

  lifecycle {
    ignore_changes = [id_blocks]
  }
}

resource "intersight_fcpool_pool" "arcflash_wwpn_b" {
  name = "arcflash_wwpn_b"
  tags = [local.terraform]
  organization {
    moid = local.organization
  }

  pool_purpose = "WWPN"

  id_blocks {
    from = "20:00:00:25:af:fb:00:01"
    size = 255
  }

  lifecycle {
    ignore_changes = [id_blocks]
  }
}