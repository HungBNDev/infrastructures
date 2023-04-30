output "ec2_staging_ami_id" {
  value = data.aws_ami.ubuntu.id
}

output "staging_instance_public_ip" {
  value = aws_instance.staging.public_ip
}

output "staging_instance_private_ip" {
  value = aws_instance.staging.private_ip
}
