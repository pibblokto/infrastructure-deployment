include "root" {
  path           = find_in_parent_folders()
  expose         = true
  merge_strategy = "deep"
}

terraform {
  source = "${dirname(find_in_parent_folders())}/modules/efs"
}

include "eks_cluster" {
  path           = "../dependencies/eks_cluster.hcl"
  expose         = true
  merge_strategy = "deep"
}

include "vpc" {
  path           = "../dependencies/vpc.hcl"
  expose         = true
  merge_strategy = "deep"
}

include "security_group" {
  path           = "../dependencies/security_group.hcl"
  expose         = true
  merge_strategy = "deep"
}


inputs = {
  cluster_name          = dependency.eks_cluster.outputs.cluster_name
  private_subnet_id     = dependency.vpc.outputs.private_subnets_ids[0]
  security_groups       = [dependency.security_group.outputs.sg_id, 
                          dependency.eks_cluster.outputs.cluster_security_group_id]
}

dependencies {

  paths = [
    "../security_group",
    "../vpc",
    "../eks_cluster"
  ]
}