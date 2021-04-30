resource "aws_instance" "servers" {
    ami = var.imagename
    count = var.server-count
    instance_type = var.instance_type
    key_name = var.key_name
    #subnet_id = "${element(module.vpc.public_subnets[*], count.index)}"
    subnet_id = "${element(var.subnet_id[*], count.index)}"
    vpc_security_group_ids = ["${var.sg_id}"]
    associate_public_ip_address = true	
    tags = {
        Name = "Server-${count.index+1}"
        Env = "Prod"
    }
}