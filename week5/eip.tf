variable "create_eip" {
  description = "create eip if set to true"
  default     = true
}

resource "aws_eip" "this" {
  count    = var.create_eip == true ? 1 : 0
  instance = aws_instance.server["subnet-5266c039"].id
}