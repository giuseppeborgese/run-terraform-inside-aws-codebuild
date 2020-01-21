resource "aws_security_group" "crypto" {
  name = "${var.prefix}"
  tags {
        Name = "${var.prefix}"
  }
  description = "${var.prefix} SG"
  egress {
    from_port   = 0
    to_port     = 65535 # All outbound traffic
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
   }
   ingress {
     from_port   = 443
     to_port     = 443 # All outbound traffic
     protocol    = "TCP"
     cidr_blocks = ["0.0.0.0/0"]
    }
}
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}
