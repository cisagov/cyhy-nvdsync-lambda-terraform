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

module "eventbridge" {
  source  = "terraform-aws-modules/eventbridge/aws"
  version = "~> 2.3"

  bus_name         = coalesce(var.eventbridge_bus_name, var.lambda_function_name)
  role_name        = coalesce(var.eventbridge_role_name, format("%s-eventbridge", var.lambda_function_name))
  role_description = var.eventbridge_role_description

  attach_lambda_policy = true

  rules = {
    crons = {
      description         = var.eventbridge_cron_description
      schedule_expression = var.eventbridge_cron_schedule_expression
    }
  }

  targets = {
    crons = [
      {
        arn = module.lambda.lambda_function_arn
      }
    ]
  }
}
