terraform {
    backend "s3" {
        bucket         = "mybucket-d435ebc5d2b448a7"
        key            = "./eks/terraform.tfstate"
        region         = "ap-south-1"
        
        
    }
}