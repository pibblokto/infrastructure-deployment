include "root" {
  path           = find_in_parent_folders()
  expose         = true
  merge_strategy = "deep"
}

terraform {
  source = "${dirname(find_in_parent_folders())}/modules/eks_cluster"
}

include "eks_iam" {
  path           = "../dependencies/eks_iam.hcl"
  expose         = true
  merge_strategy = "deep"
}

include "vpc" {
  path           = "../dependencies/vpc.hcl"
  expose         = true
  merge_strategy = "deep"
}

inputs = {
  cluster_name     = "demo_cluster"
  eks_iam_role_arn = dependency.eks_iam.outputs.eks_iam_role_arn
  subnet_ids       = dependency.vpc.outputs.private_subnets_ids
}

dependencies {

  paths = [
    "../eks_iam",
    "../vpc"
  ]
}