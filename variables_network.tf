variable "network_map_infra" {
  type = map(object({
    vlan = number
    qos  = string
  }))
  default = {
    inband_kvm = {
      vlan = 851
      qos  = "silver"
    }
    inband_vmware = {
      vlan = 840
      qos  = "silver"
    }
    vmotion = {
      vlan = 841
      qos  = "bronze"
    }
  }
}

variable "network_map_vmnetwork" {
  type = map(object({
    vlan = number
    qos  = string
  }))
  default = {
    app_842 = {
      vlan = 842
      qos  = "gold"
    }
    app_843 = {
      vlan = 843
      qos  = "gold"
    }
    app_844 = {
      vlan = 844
      qos  = "gold"
    }
    app_845 = {
      vlan = 845
      qos  = "gold"
    }
    app_846 = {
      vlan = 846
      qos  = "gold"
    }
    app_847 = {
      vlan = 847
      qos  = "gold"
    }
    app_848 = {
      vlan = 848
      qos  = "gold"
    }
    app_849 = {
      vlan = 849
      qos  = "gold"
    }
  }
}