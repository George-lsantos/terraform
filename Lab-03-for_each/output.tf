output "instance_names" {
  value = [for i in aws_instance.SRV-Linux : i.tags.Name]
}
