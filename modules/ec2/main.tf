resource "aws_instance" "webserver" {

	ami 			= var.ami_id
	instance_type		= var.instance_type
	vpc_security_group_ids	= [var.security_group_id]
	subnet_id		= var.subnet_id
	key_name		= aws_key_pair.generated_key.key_name

	tags = {
	  Name = "${var.project_name}-webserver"
	}

}
