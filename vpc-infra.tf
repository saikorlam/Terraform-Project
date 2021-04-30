module "vpc" {
  source = "./modules/vpc"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

# module "sg" {
#   source = "./modules/sg"
#   vpc_id = "${module.vpc.vpc_id}"
  
# }

# module "ec2-servers" {
#     source = "./modules/ec2"
# imagename = "ami-09d8b5222f2b93bf0"
# instance_type = "t2.nano"
# key_name = "LaptopKey"
# server-count = 1
# subnet_id = "${module.vpc.public_subnets}"  #Output Subnets needs to be defined in VPC Module.
# sg_id = "${module.sg.sg_id}"  #Output SG ID needs to be defined in SG Module.
# }