## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |
| <a name="requirement_github"></a> [github](#requirement\_github) | 6.3.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.87.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_instance.SRV-Linux](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_subnet.Subnet_public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.VPC](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | Variável para definir as AZs desejadas | `list(string)` | <pre>[<br/>  "us-east-1a",<br/>  "us-east-1b",<br/>  "us-east-1a"<br/>]</pre> | no |
| <a name="input_availability_zones_suffix"></a> [availability\_zones\_suffix](#input\_availability\_zones\_suffix) | n/a | `list(string)` | <pre>[<br/>  "a",<br/>  "b",<br/>  "c"<br/>]</pre> | no |
| <a name="input_cidr_block_subnet_public"></a> [cidr\_block\_subnet\_public](#input\_cidr\_block\_subnet\_public) | n/a | `list(string)` | <pre>[<br/>  "10.0.1.0/24",<br/>  "10.0.2.0/24",<br/>  "10.0.3.0/24"<br/>]</pre> | no |
| <a name="input_instance_namesf"></a> [instance\_namesf](#input\_instance\_namesf) | #For  EACH | `map(string)` | <pre>{<br/>  "cache": "t3.micro",<br/>  "db": "t3.medium",<br/>  "web": "t2.micro"<br/>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_names"></a> [instance\_names](#output\_instance\_names) | n/a |
