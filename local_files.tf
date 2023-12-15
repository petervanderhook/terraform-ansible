resource "local_file" "tf_backend_config" {
  content = <<EOF
terraform {
    backend "s3" {
        bucket         = "${var.bucket_name}"
        key            = "global/s3/terraform.tfstate"
        dynamodb_table = "${var.dynamodb_name}"
        region         = "${var.region}"
        encrypt        = true
    }
}
EOF
  filename = "./main/backend_config.tf"
}