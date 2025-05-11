module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "lovish-vpc"
  cidr = var.vpc_cidr

  azs             = var.availability_zones
  public_subnets  = var.public_subnets
  map_public_ip_on_launch = true

  enable_dns_hostnames = true


  tags = {
    Name = "lovish-vpc"
    terraform = "true"
    Environment = "dev"
  }
}

module "aws_service_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "jenkins-sg"
  vpc_id      = module.vpc.vpc_id
  description = "Security group for Jenkins"


  ingress_with_cidr_blocks = [
    {
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      description = "HTTP"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "SSH"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
   egress_with_cidr_blocks = [
        {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        description = "Allow all outbound traffic"
        cidr_blocks = "0.0.0.0/0"
        }
    ]
    tags = {
        Name = "jenkins-sg"
        
    }
    
    

}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "jenkins-instance"

  instance_type          = "t2.micro"
  key_name               = "key"
  vpc_security_group_ids = [module.aws_service_sg.security_group_id]
  subnet_id              = module.vpc.public_subnets[0]
  associate_public_ip_address = true
  user_data  = file("installer.sh")
  availability_zone = var.availability_zones[0]

  tags = {
    name        = "jenkins-instance"
    Terraform   = "true"
    Environment = "dev"
  }
}
