# resource "aws_elasticache_replication_group" "refinery_cache_replication_group" {
#   automatic_failover_enabled    = false
#   replication_group_id          = "refinery-rep-group"
#   replication_group_description = "replication group for the refinery elasticache cluster"
#   node_type                     = "cache.t4g.micro"
#   transit_encryption_enabled    = true
#   parameter_group_name          = aws_elasticache_parameter_group.refinery_cache_parameter_group.name
#   subnet_group_name             = aws_elasticache_subnet_group.refinery_cache_subnet_group.name
#   security_group_ids            = [aws_security_group.redis_sg.id]
#   user_group_ids                = [aws_elasticache_user_group.refinery_cache_user_group.id]
#   port                          = 6379
# }

# resource "aws_elasticache_cluster" "refinery_cache" {
#   cluster_id = "honeycomb-refinery-cache"
#   replication_group_id = aws_elasticache_replication_group.refinery_cache_replication_group.id
# }

# resource "aws_elasticache_parameter_group" "refinery_cache_parameter_group" {
#   name = "honeycomb-refinery-cache-parameter-group"
#   family = "redis6.x"
# }

# resource "aws_elasticache_subnet_group" "refinery_cache_subnet_group" {
#   name = "honeycomb-refinery-cache-subnet-group"
#   subnet_ids = [data.aws_subnet.refinery-subnet.id]
# }

# resource "aws_elasticache_user" "refinery_cache_user" {
#   user_id = "${var.redis_username}Id"
#   user_name = var.redis_username
#   access_string = "on ~* +@all"
#   engine = "REDIS"
#   passwords = ["${var.redis_password}"]
# }

# resource "aws_elasticache_user_group" "refinery_cache_user_group" {
#   engine = "REDIS"
#   user_group_id = "refineryUserGroupId"
#   user_ids = ["default", aws_elasticache_user.refinery_cache_user.id]
# }
