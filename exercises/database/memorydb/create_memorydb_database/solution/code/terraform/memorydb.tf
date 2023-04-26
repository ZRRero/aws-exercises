resource "random_password" "root_password" {
  length = 16
}

resource "aws_security_group" "security_group" {
  name = "security_group"
  vpc_id = var.vpc_id
  ingress {
    from_port = 6379
    to_port = 6379
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

resource "aws_memorydb_user" "root" {
  access_string = "on ~* &* +@all"
  user_name     = "root"
  authentication_mode {
    type = "password"
    passwords = [random_password.root_password.result]
  }
}

resource "aws_memorydb_acl" "acl" {
  name = "acl"
  user_names = [aws_memorydb_user.root.user_name]
}

resource "aws_memorydb_subnet_group" "subnet_group" {
  name = "subnet_group"
  subnet_ids = var.subnets_ids
}

resource "aws_memorydb_cluster" "cluster" {
  acl_name  = aws_memorydb_acl.acl.name
  name = "cluster"
  node_type                = "db.t4g.small"
  num_shards               = 2
  num_replicas_per_shard = 1
  subnet_group_name = aws_memorydb_subnet_group.subnet_group.id
  security_group_ids = [aws_security_group.security_group.id]
}