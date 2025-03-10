## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.87.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eip.nat_eip](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_internet_gateway.igw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.NAT](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_route_table.rtb_private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.rtb_public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.rtb_p_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.rtb_p_subnet_private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_subnet.subnet_private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.subnet_public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr_vpc"></a> [cidr\_vpc](#input\_cidr\_vpc) | cidr block vpc | `string` | `"10.0.0.0/16"` | no |
| <a name="input_subnet_private"></a> [subnet\_private](#input\_subnet\_private) | Bloco CIDR para a subnet privada | `string` | `"10.0.2.0/24"` | no |
| <a name="input_subnet_public"></a> [subnet\_public](#input\_subnet\_public) | Bloco CIDR para a subnet pública | `string` | `"10.0.1.0/24"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subnet_private_id"></a> [subnet\_private\_id](#output\_subnet\_private\_id) | ID da subnet private |
| <a name="output_subnet_public_id"></a> [subnet\_public\_id](#output\_subnet\_public\_id) | ID da subnet pública |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | ID da VPC criada |
