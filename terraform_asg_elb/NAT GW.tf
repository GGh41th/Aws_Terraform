
resource "aws_eip" "tf_nat_eip" {
    depends_on = [ aws_internet_gateway.tf_igw ]
    tags = {
        Name = "nat-eip"
    }
}

resource "aws_nat_gateway" "tf_nat_gateway" {
    allocation_id = aws_eip.tf_nat_eip.id
    subnet_id     = aws_subnet.tf_public_subnet2.id
    tags = {
        Name = "nat-gateway"
    }
}