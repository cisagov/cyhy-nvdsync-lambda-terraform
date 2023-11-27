module "lambda" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "~> 6.5"

  function_name = var.lambda_function_name
  description   = var.lambda_function_description
  handler       = var.lambda_function_handler
  runtime       = var.lambda_function_runtime

  create_package = false
  s3_existing_package = {
    bucket = var.lambda_deployment_artifact_s3_bucket
    key    = var.lambda_deployment_artifact_s3_key
  }

  vpc_subnet_ids         = var.vpc_subnet_ids
  vpc_security_group_ids = var.vpc_security_group_ids
  attach_network_policy  = true

  environment_variables = {
    db_host                  = var.db_host
    db_port                  = var.db_port
    ssm_db_authdb            = var.ssm_db_authdb
    ssm_db_pass              = var.ssm_db_pass
    ssm_db_target_collection = var.ssm_db_target_collection
    ssm_db_user              = var.ssm_db_user
  }
}
