include "root" {
  path           = find_in_parent_folders()
  expose         = true
  merge_strategy = "deep"
}

terraform {
  source = "${dirname(find_in_parent_folders())}/modules/iam"
}

include "opensearch" {
  path           = "../dependencies/opensearch.hcl"
  expose         = true
  merge_strategy = "deep"
}

include "eks_cluster" {
  path           = "../dependencies/eks_cluster.hcl"
  expose         = true
  merge_strategy = "deep"
}

inputs = {
  opensearch_domain_name = dependency.opensearch.outputs.domain_name
  issuer                 = dependency.eks_cluster.outputs.issuer
}

dependencies {

  paths = [
    "../opensearch",
    "../eks_cluster"
  ]
}