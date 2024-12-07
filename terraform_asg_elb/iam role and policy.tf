# Create an IAM Role
resource "aws_iam_role" "tf_s3_access_role" {
    name = "s3-access-role"

    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
        {
            Effect = "Allow"
            Principal = {
            Service = "ec2.amazonaws.com"  
            }
            Action = "sts:AssumeRole"
        }
        ]
    })

    tags = {
        Name = "S3AccessRole"
    }
}


resource "aws_iam_policy" "tf_s3_read_write_policy" {
    name        = "S3ReadWritePolicy"
    description = "Policy to grant read/write access to S3"
    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
        {
            Effect   = "Allow"
            Action   = [
            "s3:PutObject",
            "s3:GetObject",
            "s3:ListBucket",
            "s3:DeleteObject"
            ]
            Resource = [
            "arn:aws:s3:::tf-tutorial-ghaith-03-2003",        # Replace with your bucket name
            "arn:aws:s3:::tf-tutorial-ghaith-03-2003/*"      # For objects within the bucket
            ]
        }
        ]
    })
}

# Attach the IAM Policy to the Role
resource "aws_iam_role_policy_attachment" "attach_s3_policy" {
    role       = aws_iam_role.tf_s3_access_role.name
    policy_arn = aws_iam_policy.tf_s3_read_write_policy.arn
}


# Create an Instance Profile
resource "aws_iam_instance_profile" "tf_s3_access_instance_profile" {
    name = "s3-access-instance-profile"
    role = aws_iam_role.tf_s3_access_role.name
}


