resource "aws_db_instance" "team_rds" {
    allocated_storage = 10
    engine = "mysql"
    engine_version = "8.0.20"
    instance_class = "db.t2.micro"
    name = "sugang"
    username = "root"
    password = "It12345!"
    identifier = "sugang"
    skip_final_snapshot = true
    db_subnet_group_name = "az-rds-group"
    vpc_security_group_ids = ["${aws_security_group.DB-sg.id}"]
    multi_az = true   ## 다중 AZ 옵션
}