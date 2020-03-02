terraform {
  backend "s3" {
    bucket = "project-devops"
    key    = "DevopsProject.tfstate"
    region =  "us-east-1"
  }
}