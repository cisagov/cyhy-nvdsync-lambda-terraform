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

variable "ssm_db_authdb" {
  type        = string
  description = "The SSM Parameter Store secret that contains the database used to authenticate with the MongoDB server."
}

variable "ssm_db_pass" {
  type        = string
  description = "The SSM Parameter Store secret that contains the password used to authenticate with the MongoDB server."
}

variable "ssm_db_user" {
  type        = string
  description = "The SSM Parameter Store secret that contains the username used to authenticate with the MongoDB server."
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

variable "ssm_db_target_collection" {
  type        = string
  description = "The SSM Parameter Store secret that contains the name of the collection in the MongoDB database to import the NVD CVE data into."
  default     = null
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
