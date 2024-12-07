# Create an S3 Bucket
resource "aws_s3_bucket" "tf_s3_bucket" {
    bucket = "tf-tutorial-ghaith-03-2003"  # Replace with a globally unique name
    tags = {
        Name        = "MyBucket"
    }
}