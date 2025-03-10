variable "instance_namesf" {
  type    = map(string)
  default = {
    "web"  = "t2.micro"
    "db"   = "t3.medium"
    "cache" = "t3.micro"
  }
}