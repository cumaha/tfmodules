terraform {
  cloud {
    organization = "mahatest"
    workspaces {
      name = "abcrepo"
}
}
}

provider "aws" {
	region = var.aws_region
}

module "ec2_instance" {
	source = "./modules/ec2"
	ami_id = var.ami_id
	instance_type = var.instance_type
	instance_name = "TFCloudExample"
}

output "instance_public_ip" {
	value = module.ec2_instance.instance_public_ip
}
