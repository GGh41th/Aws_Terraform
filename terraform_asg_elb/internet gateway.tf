resource "aws_internet_gateway" "tf_igw" {
    vpc_id = aws_vpc.tf_vpc.id  
    tags = {
        Name = "terraform_tuto_internetgateway"
    }
}