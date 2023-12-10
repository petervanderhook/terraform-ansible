terraform {
    backend "s3" {
        bucket         = "pv-4630-ass3-bucket"
        key            = "global/s3/terraform.tfstate"
        dynamodb_table = "pv-4630-ass3-lock"
        region         =  "us-west-1"
        encrypt        = true
    }
}
