terraform {
    backend "s3" {
        bucket         = "pv-4630-ass3-bigbucket"
        key            = "global/s3/terraform.tfstate"
        dynamodb_table = "pv-4630-ass3-stronglock"
        region         = "us-west-1"
        encrypt        = true
    }
}
