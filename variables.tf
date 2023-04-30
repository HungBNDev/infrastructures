variable "ami_id" {
  description = "AMI id to lauch instance"
  type        = string
  default     = null
}

variable "subnet_ids" {
  description = "A list of Subnet IDs to associate with"
  type        = list(string)
  default     = null
}
variable "subnet_id" {
  description = "The VPC Subnet ID to launch in"
  type        = string
  default     = null
}
variable "vpc_id" {
  description = "The VPC ID to launch in"
  type        = string
  default     = null
}
variable "db_username" {
  description = "The Database username"
  type        = string
  default     = null
}
variable "db_password" {
  description = "The Database Password"
  type        = string
  default     = null
}
variable "aws_key_pair_name" {
  description = "The name of AWS key pair"
  type        = string
  default     = null
}
