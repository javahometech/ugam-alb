# variable "cidrs" {
#   default = ["10.0.0.0/16","10.1.0.0/16"]
#   type = set(string)
# }

# resource "aws_vpc" "main" {
#   for_each = var.cidrs
#   cidr_block = each.value
# }

# output "vpc_ids" {
#   value = [for k,v in aws_vpc.main : v.id]
# }

# output "vpc_arns" {
#   value = [for k,v in aws_vpc.main : v.arn]
# }
