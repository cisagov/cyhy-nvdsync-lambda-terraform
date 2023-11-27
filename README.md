# nvdsync-lambda-tf-module #

[![GitHub Build Status](https://github.com/cisagov/nvdsync-lambda-tf-module/workflows/build/badge.svg)](https://github.com/cisagov/nvdsync-lambda-tf-module/actions)

This is a generic skeleton project that can be used to quickly get a
new [cisagov](https://github.com/cisagov) [Terraform
module](https://www.terraform.io/docs/modules/index.html) GitHub
repository started.  This skeleton project contains [licensing
information](LICENSE), as well as [pre-commit
hooks](https://pre-commit.com) and
[GitHub Actions](https://github.com/features/actions) configurations
appropriate for the major languages that we use.

See [here](https://www.terraform.io/docs/modules/index.html) for more
details on Terraform modules and the standard module structure.

## Usage ##

```hcl
module "example" {
  source = "github.com/cisagov/nvdsync-lambda-tf-module"

  aws_region            = "us-west-1"
  aws_availability_zone = "b"
  subnet_id             = "subnet-0123456789abcdef0"
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
| lambda | terraform-aws-modules/lambda/aws | ~> 6.5 |

## Resources ##

No resources.

## Inputs ##

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| db\_host | The hostname of the MongoDB server. | `string` | n/a | yes |
| db\_port | The port to use when connecting to the MongoDB server. | `string` | `"27017"` | no |
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
