resource "random_password" "rds_password" {
  length = 16
}

resource "aws_db_subnet_group" "subnet_group" {
  provider = aws.master_region
  subnet_ids = var.subnet_ids
}

resource "aws_security_group" "security_group" {
  name = "security-group"
  vpc_id = var.vpc_id
  ingress {
    from_port = 5432
    to_port = 5432
    protocol = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

resource "aws_rds_cluster" "aurora_cluster" {
  provider = aws.master_region
  cluster_identifier = "aurora-cluster"
  engine = "aurora-postgresql"
  engine_mode = "serverless"
  engine_version = "14.6"
  master_username = "root"
  master_password = random_password.rds_password.result
  db_subnet_group_name = aws_db_subnet_group.subnet_group.name
  vpc_security_group_ids = [aws_security_group.security_group.id]
  database_name = "database"
  serverlessv2_scaling_configuration {
    min_capacity = 0.5
    max_capacity = 4
  }
}