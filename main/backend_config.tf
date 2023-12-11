terraform {
    backend "s3" {
        bucket         = "pv-4630-ass3-bigbucket2"
        key            = "global/s3/terraform.tfstate"
        dynamodb_table = "pv-4630-ass3-stronglock2"
        region         = "us-west-1"
        encrypt        = true
    }
}
