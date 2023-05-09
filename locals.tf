locals {
  # this value is the data structure to add a tag named Automation with a value of Terraform
  terraform = {
    additional_properties = ""
    key                   = "Project"
    value                 = "ARCFLASH"
  }
  # Here we choose the organization where our TF configuration should live
  organization = data.intersight_organization_organization.default.results[0].moid
}