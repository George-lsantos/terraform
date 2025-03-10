## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_instance.SRV-Linux](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_instance_namesf"></a> [instance\_namesf](#input\_instance\_namesf) | n/a | `map(string)` | <pre>{<br/>  "cache": "t3.micro",<br/>  "db": "t3.medium",<br/>  "web": "t2.micro"<br/>}</pre> | no |

## Outputs

No outputs.
