#key pair 

resource "aws_key_pair" "deployer"{
    key_name = "my_key"
    public_key = file("terra.pub")
}

# default vpc

resource "aws_default_vpc" "default"{

    tags ={
        Name = "sambhu_vpc"
    }
}

# security group

resource "aws_security_group" "security"{
    name = "sambhu-sg"
    description = "this is sg"
    vpc_id = aws_default_vpc.default.id

    ingress{
        to_port = 22
        from_port = 22
        protocol = "tcp"
        description = "SSH OPEN"
        cidr_blocks = ["0.0.0.0/0"]

    }

    egress{
        to_port = 0
        from_port = 0
        protocol = "tcp"
        description = "ALL"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "sambhu-sg"
    }
}


# ec2 instance

resource "aws_instance" "my_instance"{
    key_name = aws_key_pair.deployer.key_name
    security_groups = [aws_security_group.security.name]
    instance_type = var.ec2_instance_type
    ami = var.ec2_ami_id 
    
    root_block_device {
        volume_size = var.ec2_root_block_volume
        volume_type = "gp3"
    }

    tags = {
        Name = "sambhu-ec2"
    }
}
