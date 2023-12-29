# EC2 Instance: MongoDB 1
resource "aws_instance" "mongodb_one" {
    availability_zone = "${var.AWS_REGION}"
    ami = "ami-0c7217cdde317cfec" # Ubuntu Server 22.04 LTS (HVM),EBS General Purpose (SSD) Volume Type. Support available from Canonical (http://www.ubuntu.com/cloud/services).(64-bit (x86)
    instance_type = "t2.large"

    tags = {
        Name = "${var.ENVIRONMENT}-mongodb-one"
    }

    root_block_device {
        volume_type = "gp2"
        volume_size = "100"
    }

    security_groups = [
        "${aws_security_group.mongodb.name}"
    ]

    associate_public_ip_address = true

    key_name = "TF_key"
}

# Créé une clé privée
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Créé une clé et la rattache aux instances
resource "aws_key_pair" "TF_key" {
  key_name   = "TF_key"
  public_key = tls_private_key.rsa.public_key_openssh # on rattache la clé publique à la paire de clé créée ci-dessous
}

# Créer un fichier qui comprend la clé privée
resource "local_file" "TF-key" {
  content  = tls_private_key.rsa.private_key_pem
  filename = "TF_key"
}


# MongoDB security group
resource "aws_security_group" "mongodb" {
  name        = "mongodb-${var.ENVIRONMENT}"
  description = "Security group for mongodb-${var.ENVIRONMENT}"

  tags = {
    Name = "mongodb-${var.ENVIRONMENT}"
  }
}

resource "aws_security_group_rule" "mongodb_allow_all" {
  type            = "egress"
  from_port       = 0
  to_port         = 0
  protocol        = "-1" # Tous les protocoles
  cidr_blocks     = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.mongodb.id}"
}

resource "aws_security_group_rule" "mongodb_ssh" {
  type            = "ingress"
  from_port       = 22
  to_port         = 22
  protocol        = "tcp"
  cidr_blocks     = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.mongodb.id}"
}

resource "aws_security_group_rule" "mongodb_mongodb" {
type            = "ingress"
from_port       = 27017
to_port         = 27017
protocol        = "tcp"
cidr_blocks     = ["0.0.0.0/0"]

security_group_id = "${aws_security_group.mongodb.id}"
}

resource "aws_security_group_rule" "mongodb_mongodb_replication" {
  type            = "ingress"
  from_port       = 27019
  to_port         = 27019
  protocol        = "tcp"
  cidr_blocks     = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.mongodb.id}"
}