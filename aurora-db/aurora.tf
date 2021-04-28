resource "aws_rds_cluster" "default" {
  cluster_identifier      = "aurora-cluster-demo"
  engine                  = "aurora"
  engine_version          = "5.6.mysql_aurora.1.23.0"
  database_name           = "mydb"
  master_username         = "admin"
  master_password         = "[master_password]"
  backup_retention_period = 3
  preferred_backup_window = "07:00-09:00"
  db_cluster_parameter_group_name = "aurora-01"
  vpc_security_group_ids = [
      "[vpc_security_group_ids]",
      ]
}


resource "aws_rds_cluster_instance" "cluster_instances" {
  count              = 1
  identifier         = "aurora-cluster-demo-${count.index}"
  cluster_identifier = aws_rds_cluster.default.id
  instance_class     = "db.t3.small"
  engine             = aws_rds_cluster.default.engine
  engine_version     = aws_rds_cluster.default.engine_version
  db_parameter_group_name = "aurora-01"
  publicly_accessible = "true"
  port                   = "3306"
}
