include "root" {
  path           = find_in_parent_folders()
  expose         = true
  merge_strategy = "deep"
}

terraform {
  source = "${dirname(find_in_parent_folders())}/modules/eks_node_group"
}

include "launch_template" {
  path           = "../dependencies/launch_template.hcl"
  expose         = true
  merge_strategy = "deep"
}

include "vpc" {
  path           = "../dependencies/vpc.hcl"
  expose         = true
  merge_strategy = "deep"
}


include "eks_iam" {
  path           = "../dependencies/eks_iam.hcl"
  expose         = true
  merge_strategy = "deep"
}

include "eks_cluster" {
  path           = "../dependencies/eks_cluster.hcl"
  expose         = true
  merge_strategy = "deep"
}

inputs = {
  cluster_name            = dependency.eks_cluster.outputs.cluster_name
  node_group_role_arn     = dependency.eks_iam.outputs.worker_node_role_arn
  subnet_ids              = dependency.vpc.outputs.private_subnets_ids
  launch_template_id      = dependency.launch_template.outputs.launch_template_id
  launch_template_version = dependency.launch_template.outputs.latest_version
}

dependencies {

  paths = [
    "../launch_template",
    "../vpc",
    "../eks_iam",
    "../eks_cluster"
  ]
}