include "root" {
  path           = find_in_parent_folders()
  expose         = true
  merge_strategy = "deep"
}

terraform {
  source = "${dirname(find_in_parent_folders())}/modules/ansible_bastion"
}

include "vpc" {
  path           = "../dependencies/vpc.hcl"
  expose         = true
  merge_strategy = "deep"
}

include "eks_cluster" {
  path           = "../dependencies/eks_cluster.hcl"
  expose         = true
  merge_strategy = "deep"
}

include "security_group" {
  path           = "../dependencies/security_group.hcl"
  expose         = true
  merge_strategy = "deep"
}

include "ecr_iam" {
  path           = "../dependencies/ecr_iam.hcl"
  expose         = true
  merge_strategy = "deep"
}

inputs = {
  public_subnet_id = dependency.vpc.outputs.public_subnets_ids[0]
  eks_sg_id        = dependency.eks_cluster.outputs.cluster_security_group_id
  additional_sg_id = dependency.security_group.outputs.sg_id
  cluster_name     = dependency.eks_cluster.outputs.cluster_name
  ecr_role_name    = dependency.ecr_iam.outputs.ecr_iam_role_name
}

dependencies {

  paths = [
    "../security_group",
    "../eks_cluster",
    "../vpc",
    "../ecr_iam"
  ]
}