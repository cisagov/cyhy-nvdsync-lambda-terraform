# nvdsync-lambda-tf-module #

[![GitHub Build Status](https://github.com/cisagov/nvdsync-lambda-tf-module/workflows/build/badge.svg)](https://github.com/cisagov/nvdsync-lambda-tf-module/actions)

This project creates the resources necessary to deploy [cisagov/cyhy-nvdsync-lambda](https://github.com/cisagov/cyhy-nvdsync-lambda)
with an AWS EventBridge configuration to trigger it on a schedule.

## Usage ##

```hcl
module "nvdsync_lambda" {
  source = "github.com/cisagov/nvdsync-lambda-tf-module"

  lambda_function_name = "nvdsync-lambda"

  lambda_deployment_artifact_s3_bucket = "lambda-artifacts"
  lambda_deployment_artifact_s3_key    = "nvdsync-lambda/lambda.zip"

  db_host = "database.example.com"

  ssm_db_authdb = "/nvdsync-lambda/production/db/authentication_db"
  ssm_db_pass   = "/nvdsync-lambda/production/db/password"
  ssm_db_user   = "/nvdsync-lambda/production/db/username"
}
```

## Examples ##

- [Basic usage](https://github.com/cisagov/nvdsync-lambda-tf-module/tree/develop/examples/basic_usage)

<!-- BEGIN_TF_DOCS -->
## Requirements ##

| Name | Version |
|------|---------|
| terraform | ~> 1.0 |
| aws | ~> 4.9 |

## Providers ##

No providers.

## Modules ##

| Name | Source | Version |
|------|--------|---------|
| eventbridge | terraform-aws-modules/eventbridge/aws | ~> 2.3 |
| lambda | terraform-aws-modules/lambda/aws | ~> 6.5 |

## Resources ##

No resources.

## Inputs ##

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| db\_host | The hostname of the MongoDB server. | `string` | n/a | yes |
| db\_port | The port to use when connecting to the MongoDB server. | `string` | `"27017"` | no |
| eventbridge\_bus\_name | The name of the EventBridge bus to create. If a value is not provided, the value of the lambda\_function\_name variable will be used. | `string` | `null` | no |
| eventbridge\_cron\_description | The description to associate with the EventBridge cron configuration. | `string` | `"Run the cyhy-nvdsync Lambda every day at midnight UTC."` | no |
| eventbridge\_cron\_schedule\_expression | The schedule expression for the EventBridge cron configuration. | `string` | `"cron(0 0 * * ? *)"` | no |
| eventbridge\_role\_description | The description to associate with the IAM role for the EventBridge. | `string` | `"IAM role for the CyHy NVD Sync EventBridge."` | no |
| eventbridge\_role\_name | The name of the IAM role for the EventBridge. If a value is not provided, the value of the lambda\_function\_name variable with "-eventbridge" will be used. | `string` | `null` | no |
| lambda\_deployment\_artifact\_s3\_bucket | The name of the S3 bucket where the Lambda function deployment artifact is stored. | `string` | n/a | yes |
| lambda\_deployment\_artifact\_s3\_key | The S3 object key for the Lambda function deployment artifact stored in the CyHy Lambda artifacts S3 bucket. | `string` | n/a | yes |
| lambda\_function\_description | The description to associate with the Lambda function. | `string` | `"Lambda function for importing NVD CVE data into the CyHy MongoDB database."` | no |
| lambda\_function\_handler | The entrypoint for the Lambda. | `string` | `"lambda_handler.handler"` | no |
| lambda\_function\_name | The name for the Lambda function. | `string` | n/a | yes |
| lambda\_function\_runtime | The base name for the Lambda function. | `string` | `"python3.9"` | no |
| ssm\_db\_authdb | The SSM Parameter Store secret that contains the database used to authenticate with the MongoDB server. | `string` | n/a | yes |
| ssm\_db\_pass | The SSM Parameter Store secret that contains the password used to authenticate with the MongoDB server. | `string` | n/a | yes |
| ssm\_db\_target\_collection | The SSM Parameter Store secret that contains the name of the collection in the MongoDB database to import the NVD CVE data into. | `string` | `null` | no |
| ssm\_db\_user | The SSM Parameter Store secret that contains the username used to authenticate with the MongoDB server. | `string` | n/a | yes |
| tags | Tags to apply to all AWS resources created. | `map(string)` | `{}` | no |
| vpc\_security\_group\_ids | The list of security group IDs to associate with the Lambda function. | `list(string)` | `null` | no |
| vpc\_subnet\_ids | The list of subnet IDs to associate with the Lambda function. | `list(string)` | `null` | no |

## Outputs ##

| Name | Description |
|------|-------------|
| lambda\_function\_arn | The ARN of the Lambda function. |
<!-- END_TF_DOCS -->

## Notes ##

Running `pre-commit` requires running `terraform init` in every directory that
contains Terraform code. In this repository, these are the main directory and
every directory under `examples/`.

## Contributing ##

We welcome contributions!  Please see [`CONTRIBUTING.md`](CONTRIBUTING.md) for
details.

## License ##

This project is in the worldwide [public domain](LICENSE).

This project is in the public domain within the United States, and
copyright and related rights in the work worldwide are waived through
the [CC0 1.0 Universal public domain
dedication](https://creativecommons.org/publicdomain/zero/1.0/).

All contributions to this project will be released under the CC0
dedication. By submitting a pull request, you are agreeing to comply
with this waiver of copyright interest.
