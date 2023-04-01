skip = true


locals {
  environment_vars = read_terragrunt_config(find_in_parent_folders("shared_vars.hcl"))
  region = local.environment_vars.locals.region
}

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket  = "state-bucket-23eehd72"
    region  = "us-east-1"
    key     = "${path_relative_to_include()}/terraform.tfstate"
    encrypt = true
  }
}

generate "provider" {

  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  
  contents  = <<EOF
  provider "aws" {
  region = "${local.region}"
}
EOF
}

inputs = merge(
  local.environment_vars.locals,
)