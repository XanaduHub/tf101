data "aws_ami" "latest_ami" {
  most_recent = true

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }

  owners = ["amazon"]
}

locals {
  subnet_ids = toset([
    "subnet-5266c039",
    "subnet-9e313bd2",
  ])
}

resource "aws_instance" "server" {
  for_each = local.subnet_ids

  ami           = data.aws_ami.latest_ami.id
  instance_type = "t2.micro"
  subnet_id     = each.key # note: each.key and each.value are the same for a set

  tags = {
    Name = "Server ${each.key}"
  }
}

