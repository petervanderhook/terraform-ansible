
output "sg_be_id" {
  value = aws_security_group.sg_be.id
}
output "sg_web_id" {
  value = aws_security_group.sg_web.id
}
output "sg_db_id" {
  value = aws_security_group.sg_db.id
}

