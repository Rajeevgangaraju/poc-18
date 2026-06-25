terraform {
  backend "s3" {
    bucket         = "rajeev-poc-18"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "rajeev-pov18lock"
  }
}
