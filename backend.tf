terraform {
  backend "s3" {
    bucket  = "demolbecsapi" 
    key     = "demo/terraform.tfstate"  
    region  = "us-east-1"  
    encrypt = true
  }
}
