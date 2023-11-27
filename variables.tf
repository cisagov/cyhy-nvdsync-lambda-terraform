# ------------------------------------------------------------------------------
# REQUIRED PARAMETERS
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

variable "db_host" {
  description = "The hostname of the MongoDB server."
  type        = string
}

variable "lambda_deployment_artifact_s3_bucket" {
  description = "The name of the S3 bucket where the Lambda function deployment artifact is stored."
  type        = string
}

variable "lambda_deployment_artifact_s3_key" {
  description = "The S3 object key for the Lambda function deployment artifact stored in the CyHy Lambda artifacts S3 bucket."
  type        = string
}

variable "lambda_function_name" {
  description = "The name for the Lambda function."
  type        = string
}

variable "ssb_db_secrets" {
  description = "The SSM Parameter Store secrets that contain the information necessary to connect to the MongoDB server."
  type = object({
    authdb            = string
    pass              = string
    user              = string
    target_collection = optional(string)
  })
}

# ------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------

variable "db_port" {
  default     = "27017"
  description = "The port to use when connecting to the MongoDB server."
  type        = string
}

variable "eventbridge_bus_name" {
  default     = null
  description = "The name of the EventBridge bus to create. If a value is not provided, the value of the lambda_function_name variable will be used."
  type        = string
}

variable "eventbridge_cron_description" {
  default     = "Run the cyhy-nvdsync Lambda every day at midnight UTC."
  description = "The description to associate with the EventBridge cron configuration."
  type        = string
}

variable "eventbridge_cron_schedule_expression" {
  default     = "cron(0 0 * * ? *)"
  description = "The schedule expression for the EventBridge cron configuration."
  type        = string
}

variable "eventbridge_role_description" {
  default     = "IAM role for the CyHy NVD Sync EventBridge."
  description = "The description to associate with the IAM role for the EventBridge."
  type        = string
}

variable "eventbridge_role_name" {
  default     = null
  description = "The name of the IAM role for the EventBridge. If a value is not provided, the value of the lambda_function_name variable with \"-eventbridge\" will be used."
  type        = string
}

variable "lambda_function_description" {
  default     = "Lambda function for importing NVD CVE data into the CyHy MongoDB database."
  description = "The description to associate with the Lambda function."
  type        = string
}

variable "lambda_function_handler" {
  default     = "lambda_handler.handler"
  description = "The entrypoint for the Lambda."
  type        = string
}

variable "lambda_function_runtime" {
  default     = "python3.9"
  description = "The base name for the Lambda function."
  type        = string
}

variable "tags" {
  default     = {}
  description = "Tags to apply to all AWS resources created."
  type        = map(string)
}

variable "vpc_security_group_ids" {
  default     = null
  description = "The list of security group IDs to associate with the Lambda function."
  type        = list(string)
}

variable "vpc_subnet_ids" {
  default     = null
  description = "The list of subnet IDs to associate with the Lambda function."
  type        = list(string)
}
