# Create publicaly accessible RDS instance with defaults
module "database" {
  source                 = "voquis/rds-enhanced-monitoring/aws"
  version                = "0.0.2"
  publicly_accessible    = true
  subnet_ids             = var.subnet_ids
  vpc_security_group_ids = [aws_security_group.staging.id]
  identifier             = "staging"
  instance_class         = "db.t3.small"
  engine                 = "postgres"
  engine_version         = "14.3"
  username               = "${var.db_username}"
  parameter_group_name   = "default.postgres14"
  password               = "${var.db_password}"
  allocated_storage      = "30"
}
# Create role for EC2 instances to acquire credentials
module "ec2_role_db_connect" {
  source         = "voquis/ec2-role-rds-db-connect/aws"
  version        = "0.0.1"
  db_resource_id = module.database.db_instance.resource_id
}
