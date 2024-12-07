resource "aws_launch_template" "tf_asg_lt" {
    name          = "asg_lt"
    image_id      = "ami-045a8ab02aadf4f88" # Replace with your AMI
    instance_type = "t2.micro"
    iam_instance_profile {
        name = aws_iam_instance_profile.tf_s3_access_instance_profile.name
    }
    vpc_security_group_ids = [aws_security_group.tf_asg_sg.id]

}

resource "aws_autoscaling_group" "tf_asg" {
    desired_capacity     = 2
    max_size             = 3
    min_size             = 1
    vpc_zone_identifier  = [aws_subnet.tf_private_subnet1.id,aws_subnet.tf_private_subnet2.id]
    launch_template {
        id      = aws_launch_template.tf_asg_lt.id
        version = "$Latest"
    }
    target_group_arns = [aws_lb_target_group.tf_alb_target_group.arn]

}