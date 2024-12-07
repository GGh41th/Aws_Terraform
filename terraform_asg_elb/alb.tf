resource "aws_lb" "tf_alb" {
    name               = "web-servers-load-balancer"
    internal           = false  # Set to true for an internal ALB
    load_balancer_type = "application"
    security_groups    = [aws_security_group.tf_asg_sg.id]
    subnets            = [aws_subnet.tf_private_subnet1.id,aws_subnet.tf_private_subnet2.id]  # Add your subnet IDs here

    enable_deletion_protection = false
    idle_timeout = 60
}


resource "aws_lb_listener" "tf_alb_listener" {
    load_balancer_arn = aws_lb.tf_alb.arn
    port              = "80"  # Can be "80" for HTTP or "443" for HTTPS
    protocol          = "HTTP"  # Use "HTTPS" for secure traffic

    default_action {
        type             = "fixed-response"
        fixed_response {
        status_code = 200
        content_type = "text/plain"
        message_body = "OK"
        }
    }
}

resource "aws_lb_target_group" "tf_alb_target_group" {
    name     = "web-servers-lb-tg"
    port     = 80  # Port to forward traffic to
    protocol = "HTTP"  # Protocol the target group will use

    vpc_id = aws_vpc.tf_vpc.id

    health_check {
        path                = "/"
        interval            = 30
        timeout             = 5
        healthy_threshold   = 3
        unhealthy_threshold = 3
    }
}





resource "aws_lb_listener_rule" "tf_listener_rule" {
    listener_arn = aws_lb_listener.tf_alb_listener.arn
    priority     = 100

    action {
        type             = "forward"
        target_group_arn = aws_lb_target_group.tf_alb_target_group.arn
    }

    condition {
        path_pattern {
        values = ["/path/*"]  # Optional: Only forward requests matching a specific path
        }
    }
}



