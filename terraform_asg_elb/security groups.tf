resource "aws_security_group" "tf_jumpserver_sg" {
    name        = "jump-server-security-group"
    description = "Allow SSH"
    vpc_id      = aws_vpc.tf_vpc.id

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"] 
        ipv6_cidr_blocks  = ["::/0"]       
    }


    tags = {
        Name = "jumpserver_sg"
    }
}


resource "aws_security_group" "tf_asg_sg" {
    name        = "asg_security_group"
    description = "Allow SSH and http"
    vpc_id      = aws_vpc.tf_vpc.id

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"] 
        ipv6_cidr_blocks  = ["::/0"]       
    }

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"] 
        ipv6_cidr_blocks  = ["::/0"]       
    }


    tags = {
        Name = "asg_sg"
    }
}


resource "aws_security_group" "tf_alb_sg" {
    name        = "application load balancer security group"
    description = "Allow http traffic"
    vpc_id      = aws_vpc.tf_vpc.id

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"] 
        ipv6_cidr_blocks  = ["::/0"]       
    }


    tags = {
        Name = "alb_security_group"
    }
}
