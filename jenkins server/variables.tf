
variable "public_subnets" {
    description = "List of public subnet CIDRs"
    type        = list(string)
   
    
}


variable "vpc_cidr" {
    description = "CIDR block for the VPC"
    type        = string
    
  
}
variable "availability_zones" {
    description = "List of availability zones for the VPC"
    type        = list(string)
    
    
  
}