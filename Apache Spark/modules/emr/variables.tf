variable "name" {
  default = "spark-emr-studi-ecf"
}

variable "region" {
  default = "eu-central-1"
}

variable "subnet_id" {
  default = "subnet-9508bfd8"
}

variable "vpc_id" {
  default = "	vpc-19bb9770"
}

variable "key_name" {
  default = "my-keypair"
}

variable "release_label" {
  default = "emr-6.3.0"
}

variable "applications" {
  type = list(string)
  default = ["Spark", "Hadoop"]
}

variable "master_instance_type" {
  default = "m2.xlarge"
}

variable "master_ebs_size" {
  default = 50
}

variable "core_instance_type" {
  default = "m2.xlarge"
}

variable "core_instance_count" {
  default = 2
}

variable "core_ebs_size" {
  default = 50
}

variable "ingress_cidr_blocks" {
  type = list(string)
  default = ["0.0.0.0/0"]
}
