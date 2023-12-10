
variable "db_name" {
    default = "my_db"
}
variable "engine" {
    default = "mysql"
}
variable "engine_version" {
    default = "5.7"
}
variable "skip_final_snapshot" {
    default = true
}
variable "db_user" {
    default = "backend"
}
variable "db_pass" {
    default = "password"
}
variable "allocated_storage" {
    default = 5
}
variable "security_group_ids" {
}

variable "db_1_sn" {
}
variable "db_2_sn" {
}






