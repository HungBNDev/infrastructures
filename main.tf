# Create EC2 instance (ubuntu)
resource "aws_instance" "staging" {
  ami                    = var.ami_id
  instance_type          = "t2.small"
  iam_instance_profile   = module.ec2_role_db_connect.iam_instance_profile.id
  key_name               = "${var.aws_key_pair_name}"
  vpc_security_group_ids = [aws_security_group.staging.id]
  subnet_id              = var.subnet_id

  tags = {
    Stack = "staging"
    Role = "web"
    Environment = "staging"
    Name = "staging.web"
  }
}

resource "aws_security_group" "staging" {
  name        = "allow_ssh_staging"
  description = "Allow SSH access"
  vpc_id      = var.vpc_id

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "SSH"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "SSH"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}
