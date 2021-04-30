resource "aws_ebs_volume" "ebsvol" {
  availability_zone = var.region
  size              = var.volsize
  type              = var.type
}
