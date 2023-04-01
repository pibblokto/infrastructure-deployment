include "root" {
  path           = find_in_parent_folders()
  expose         = true
  merge_strategy = "deep"
}

terraform {
  source = "${dirname(find_in_parent_folders())}/modules/launch_template"
}

include "efs" {
  path           = "../dependencies/efs.hcl"
  expose         = true
  merge_strategy = "deep"
}

include "security_group" {
  path           = "../dependencies/security_group.hcl"
  expose         = true
  merge_strategy = "deep"
}

include "eks_cluster" {
  path           = "../dependencies/eks_cluster.hcl"
  expose         = true
  merge_strategy = "deep"
}

inputs = {
  eks_cluster_name      = dependency.eks_cluster.outputs.cluster_name
  mount_target_dns_name = dependency.efs.outputs.efs_dns
  eks_sg_id             = dependency.eks_cluster.outputs.cluster_security_group_id
  additional_sg_id      = dependency.security_group.outputs.sg_id
}

dependencies {

  paths = [
    "../security_group",
    "../eks_cluster",
    "../efs"
  ]
}