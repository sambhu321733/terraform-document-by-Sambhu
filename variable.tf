variable "ec2_instance_type"{
    default = "t2.medium"
    type = string
}

variable "ec2_ami_id"{
    default = "ami-0360c520857e3138f"
    type = string
}

variable "ec2_root_block_volume"{
    default = 20
    type = number
}
