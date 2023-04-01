include "root" {
  path           = find_in_parent_folders()
  expose         = true
  merge_strategy = "deep"
}


terraform {
  source = "${dirname(find_in_parent_folders())}/modules/security_group"
}

include "vpc" {
  path           = "../dependencies/vpc.hcl"
  expose         = true
  merge_strategy = "deep"
}

inputs = {
  vpc_id      = dependency.vpc.outputs.vpc_id
}

dependencies {

  paths = [
    "../vpc"
  ]
}