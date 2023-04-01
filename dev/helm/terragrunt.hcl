include "root" {
  path           = find_in_parent_folders("helm.hcl")
  expose         = true
  merge_strategy = "deep"
}

terraform {
  source = "${dirname(find_in_parent_folders())}/modules/helm"
}

include "eks_cluster" {
  path           = "../dependencies/eks_cluster.hcl"
  expose         = true
  merge_strategy = "deep"
}

include "iam" {
  path           = "../dependencies/iam.hcl"
  expose         = true
  merge_strategy = "deep"
}

inputs = {
  cluster_name            = dependency.eks_cluster.outputs.cluster_name
  ingress_controller_role = dependency.iam.outputs.alb_controller_role_arn
  secret_manager_role     = dependency.iam.outputs.secret_manager_role_arn

}

dependencies {

  paths = [
    "../security_group",
    "../eks_cluster",
    "../vpc",
    "../eks_node_group"
  ]
}
