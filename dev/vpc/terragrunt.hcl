include "root" {
  path           = find_in_parent_folders()
  expose         = true
  merge_strategy = "deep"
}


terraform {
  source = "${dirname(find_in_parent_folders())}/modules/vpc"
}


inputs = {
  vpc_range        = "192.168.0.0/16"
  private_subnets  = ["192.168.1.0/24","192.168.2.0/24", "192.168.3.0/24"]
  public_subnets   = ["192.168.4.0/24","192.168.5.0/24"]
}