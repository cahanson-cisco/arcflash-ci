locals {
  terraform = {
    additional_properties = ""
    key                   = "Project"
    value                 = "ARCFLASH"
  }
  organization = data.intersight_organization_organization.default.results[0].moid
}
