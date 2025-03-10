## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |
| <a name="requirement_github"></a> [github](#requirement\_github) | 6.3.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.90.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eip.nat_eip](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_internet_gateway.igw_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
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
| <a name="input_availability_zones_suffix"></a> [availability\_zones\_suffix](#input\_availability\_zones\_suffix) | n/a | `list(string)` | n/a | yes |
| <a name="input_az_priv"></a> [az\_priv](#input\_az\_priv) | availability\_zone  para subnet privado | `list(string)` | n/a | yes |
| <a name="input_az_pub"></a> [az\_pub](#input\_az\_pub) | availability\_zone  para subnet public | `list(string)` | n/a | yes |
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | Cidr\_block da VPC | `string` | n/a | yes |
| <a name="input_cidr_block_subnet_private"></a> [cidr\_block\_subnet\_private](#input\_cidr\_block\_subnet\_private) | Cidr\_block da subnet private | `list(string)` | n/a | yes |
| <a name="input_cidr_block_subnet_public"></a> [cidr\_block\_subnet\_public](#input\_cidr\_block\_subnet\_public) | Cidr\_block da subnet public | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_route_table_association"></a> [aws\_route\_table\_association](#output\_aws\_route\_table\_association) | n/a |
| <a name="output_subnet_private_cidr"></a> [subnet\_private\_cidr](#output\_subnet\_private\_cidr) | n/a |
| <a name="output_subnet_public_cidr"></a> [subnet\_public\_cidr](#output\_subnet\_public\_cidr) | n/a |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | n/a |
