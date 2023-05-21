resource "random_password" "rds_password" {
  length = 16
}

resource "aws_rds_cluster" "aurora_cluster" {
  provider = aws.master_region
  cluster_identifier = "aurora-cluster"
  engine = "aurora-postgresql"
  engine_mode = "serverless"
  engine_version = "14.6"
  master_username = "root"
  master_password = random_password.rds_password.result
}