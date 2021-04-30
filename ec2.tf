module "ec2-servers" {
    source = "./modules/ec2"
imagename = "ami-09d8b5222f2b93bf0"
instance_type = "t2.nano"
key_name = "LaptopKey"
server-count = 1
subnet_id = "${module.vpc.public_subnets}"  #Output Subnets needs to be defined in VPC Module.
sg_id = "${module.sg.sg_id}"  #Output SG ID needs to be defined in SG Module.
}

module "ebs" {
    source = "./modules/storage"
volsize = 5
type = "gp2"
region = "us-east-1a"
}