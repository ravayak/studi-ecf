module "s3" {
  source = "./modules/s3"
  name   = "${var.name}"
}

module "iam" {
  source = "./modules/iam"
}

module "security" {
  source              = "./modules/security"
  name                = "${var.name}"
  vpc_id              = "${var.vpc_id}"
  ingress_cidr_blocks = "${var.ingress_cidr_blocks}"
}

module "emr" {
  source                    = "./modules/emr"
  name                      = "${var.name}"
  applications              = "${var.applications}"
  subnet_id                 = "${var.subnet_id}"
  key_name                  = "${var.key_name}"
  master_instance_type      = "${var.master_instance_type}"
  master_ebs_size           = "${var.master_ebs_size}"
  core_instance_type        = "${var.core_instance_type}"
  core_instance_count       = "${var.core_instance_count}"
  core_ebs_size             = "${var.core_ebs_size}"
}
