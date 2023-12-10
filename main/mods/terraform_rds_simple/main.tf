resource "aws_db_subnet_group" "db_group" {
	subnet_ids = [var.db_1_sn, var.db_2_sn]
	tags = {
		name = "db_group"
	}
}
resource "aws_db_instance" "db" {
	allocated_storage = var.allocated_storage
	db_name	= "my_db"
	engine = var.engine
	skip_final_snapshot = var.skip_final_snapshot
	instance_class = "db.t2.micro"
	engine_version = var.engine_version
	username = var.db_user
	password = var.db_pass
	vpc_security_group_ids = var.security_group_ids
	db_subnet_group_name = aws_db_subnet_group.db_group.name
	tags = {
		name = "db"
		type = "demo"
	}
}
