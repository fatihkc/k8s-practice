terraform {
  backend "s3" {
    bucket = "fatihkc-k8s-practice-tf"
    key    = "terraform.tfstate" # The path to the state file in your bucket.
    region = "us-east-1"
    #dynamodb_table = "k8s-practice" # Locking
  }
}