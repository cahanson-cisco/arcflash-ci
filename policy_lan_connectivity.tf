resource "intersight_vnic_lan_connectivity_policy" "arcflash-server" {
  name = "arcflash-server"
  tags = [local.terraform]
  organization {
    moid = local.organization
  }

  placement_mode  = "custom"
  target_platform = "FIAttached"
}

resource "intersight_vnic_eth_if" "mgmt-a" {
  name = "mgmt-a"
  tags = [local.terraform]

  order            = 2
  mac_address_type = "POOL"

  mac_pool {
    moid = intersight_macpool_pool.arcflash_mac_a.moid
  }

  placement {
    switch_id = "A"
    id = "MLOM"
  }

  cdn {
    nr_source = "vnic"
  }

  fabric_eth_network_group_policy {
    moid = intersight_fabric_eth_network_group_policy.mgmt.moid
  }

  fabric_eth_network_control_policy {
    moid = intersight_fabric_eth_network_control_policy.default.moid
  }

  eth_qos_policy {
    moid = intersight_vnic_eth_qos_policy.default["be"].moid
  }

  eth_adapter_policy {
    moid = intersight_vnic_eth_adapter_policy.vmware.moid
  }

  lifecycle {
    ignore_changes = [cdn]
  }

  lan_connectivity_policy {
    moid = intersight_vnic_lan_connectivity_policy.arcflash-server.moid
  }

}

resource "intersight_vnic_eth_if" "mgmt-b" {
  name = "mgmt-b"
  tags = [local.terraform]

  order            = 3
  mac_address_type = "POOL"

  mac_pool {
    moid = intersight_macpool_pool.arcflash_mac_b.moid
  }

  placement {
    switch_id = "B"
    id = "MLOM"

  }

  cdn {
    nr_source = "vnic"
  }

  fabric_eth_network_group_policy {
    moid = intersight_fabric_eth_network_group_policy.mgmt.moid
  }

  fabric_eth_network_control_policy {
    moid = intersight_fabric_eth_network_control_policy.default.moid
  }

  eth_qos_policy {
    moid = intersight_vnic_eth_qos_policy.default["be"].moid
  }

  eth_adapter_policy {
    moid = intersight_vnic_eth_adapter_policy.vmware.moid
  }

  lifecycle {
    ignore_changes = [cdn]
  }

  lan_connectivity_policy {
    moid = intersight_vnic_lan_connectivity_policy.arcflash-server.moid
  }
}

resource "intersight_vnic_eth_if" "apps-a" {
  name = "apps-a"
  tags = [local.terraform]

  order            = 4
  mac_address_type = "POOL"

  mac_pool {
    moid = intersight_macpool_pool.arcflash_mac_a.moid
  }

  placement {
    switch_id = "A"
    id = "MLOM"
  }

  cdn {
    nr_source = "vnic"
  }

  fabric_eth_network_group_policy {
    moid = intersight_fabric_eth_network_group_policy.apps.moid
  }

  fabric_eth_network_control_policy {
    moid = intersight_fabric_eth_network_control_policy.default.moid
  }

  eth_qos_policy {
    moid = intersight_vnic_eth_qos_policy.default["be"].moid
  }

  eth_adapter_policy {
    moid = intersight_vnic_eth_adapter_policy.vmware.moid
  }

  lifecycle {
    ignore_changes = [cdn]
  }

  lan_connectivity_policy {
    moid = intersight_vnic_lan_connectivity_policy.arcflash-server.moid
  }

}

resource "intersight_vnic_eth_if" "apps-b" {
  name = "apps-b"
  tags = [local.terraform]

  order            = 5
  mac_address_type = "POOL"

  mac_pool {
    moid = intersight_macpool_pool.arcflash_mac_b.moid
  }

  placement {
    switch_id = "B"
    id = "MLOM"

  }

  cdn {
    nr_source = "vnic"
  }

  fabric_eth_network_group_policy {
    moid = intersight_fabric_eth_network_group_policy.apps.moid
  }

  fabric_eth_network_control_policy {
    moid = intersight_fabric_eth_network_control_policy.default.moid
  }

  eth_qos_policy {
    moid = intersight_vnic_eth_qos_policy.default["be"].moid
  }

  eth_adapter_policy {
    moid = intersight_vnic_eth_adapter_policy.vmware.moid
  }

  lifecycle {
    ignore_changes = [cdn]
  }

  lan_connectivity_policy {
    moid = intersight_vnic_lan_connectivity_policy.arcflash-server.moid
  }
}