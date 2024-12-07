resource "aws_instance" "tf_jump_server" {
    ami           = "ami-045a8ab02aadf4f88"  
    instance_type = "t2.micro"             
    subnet_id     = aws_subnet.tf_public_subnet1.id
    key_name      = "jenkins"
    security_groups = [aws_security_group.tf_jumpserver_sg.id]
    tags = {
        Name = "Jump Server"
    }
}