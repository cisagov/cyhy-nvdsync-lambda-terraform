# ------------------------------------------------------------------------------
# REQUIRED PARAMETERS
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

variable "db_host" {
  type        = string
  description = "The hostname of the MongoDB server."
}

variable "lambda_deployment_artifact_s3_bucket" {
  type        = string
  description = "The name of the S3 bucket where the Lambda function deployment artifact is stored."
}

variable "lambda_deployment_artifact_s3_key" {
  type        = string
  description = "The S3 object key for the Lambda function deployment artifact stored in the CyHy Lambda artifacts S3 bucket."
}

variable "lambda_function_name" {
  type        = string
  description = "The name for the Lambda function."
}

variable "ssb_db_secrets" {
  type = object({
    authdb            = string
    pass              = string
    user              = string
    target_collection = optional(string)
  })
  description = "The SSM Parameter Store secrets that contain the information necessary to connect to the MongoDB server."
}

# ------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------

variable "db_port" {
  type        = string
  description = "The port to use when connecting to the MongoDB server."
  default     = "27017"
}

variable "eventbridge_bus_name" {
  type        = string
  description = "The name of the EventBridge bus to create. If a value is not provided, the value of the lambda_function_name variable will be used."
  default     = null
}

variable "eventbridge_cron_description" {
  type        = string
  description = "The description to associate with the EventBridge cron configuration."
  default     = "Run the cyhy-nvdsync Lambda every day at midnight UTC."
}

variable "eventbridge_cron_schedule_expression" {
  type        = string
  description = "The schedule expression for the EventBridge cron configuration."
  default     = "cron(0 0 * * ? *)"
}

variable "eventbridge_role_description" {
  type        = string
  description = "The description to associate with the IAM role for the EventBridge."
  default     = "IAM role for the CyHy NVD Sync EventBridge."
}

variable "eventbridge_role_name" {
  type        = string
  description = "The name of the IAM role for the EventBridge. If a value is not provided, the value of the lambda_function_name variable with \"-eventbridge\" will be used."
  default     = null
}

variable "lambda_function_description" {
  type        = string
  description = "The description to associate with the Lambda function."
  default     = "Lambda function for importing NVD CVE data into the CyHy MongoDB database."
}

variable "lambda_function_handler" {
  type        = string
  description = "The entrypoint for the Lambda."
  default     = "lambda_handler.handler"
}

variable "lambda_function_runtime" {
  type        = string
  description = "The base name for the Lambda function."
  default     = "python3.9"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all AWS resources created."
  default     = {}
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "The list of security group IDs to associate with the Lambda function."
  default     = null
}

variable "vpc_subnet_ids" {
  type        = list(string)
  description = "The list of subnet IDs to associate with the Lambda function."
  default     = null
}
