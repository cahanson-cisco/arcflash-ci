resource "intersight_bios_policy" "virtualization" {
  name = "virtualization"
  tags = [local.terraform]
  organization {
    moid = local.organization
  }
  
  cpu_perf_enhancement                  = "Auto"
  processor_c1e                         = "enabled"
  processor_c6report                    = "enabled"
  energy_efficient_turbo                = "enabled"
  cisco_adaptive_mem_training           = "enabled"
  lom_ports_all_state                   = "disabled"
}
