# name of the bucket for tf state storage
variable "service_bucket_name" {
  default = "my_s3_bucket"
}

# region name
variable "aws_region" {
  default = "us-east-1"
}

#cidr block for whole vpc subnet 
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
#cidr block for 1st subnet
variable "subnet1_cidr" {
  default = "10.0.1.0/24"
}
#cidr block for 2nd subnet
variable "subnet2_cidr" {
  default = "10.0.2.0/24"
}