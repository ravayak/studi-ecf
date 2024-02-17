# EMR general configurations
name = "spark-app"
region = "eu-central-1"
subnet_id = "subnet-9508bfd8"
vpc_id = "vpc-19bb9770"
key_name = "my-key-pair"
ingress_cidr_blocks = "0.0.0.0/0"
release_label = "emr-5.16.0"
applications = ["Spark"]

# Master node configurations
master_instance_type = "m2.xlarge"
master_ebs_size = "50"

# Slave nodes configurations
core_instance_type = "m1.xlarge"
core_instance_count = 1
core_ebs_size = "50"
