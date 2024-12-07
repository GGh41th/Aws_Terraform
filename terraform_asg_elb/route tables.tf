resource "aws_route_table" "tf_public_rt" {
    vpc_id = aws_vpc.tf_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.tf_igw.id
    }

    tags = {
        Name = "public-route-table"
    }
}

resource "aws_route_table" "tf_private_rt" {
    vpc_id = aws_vpc.tf_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.tf_nat_gateway.id
    }

    tags = {
        Name = "public-route-table"
    }
}

resource "aws_route_table_association" "tf_public_association1" {
    subnet_id      = aws_subnet.tf_public_subnet1.id
    route_table_id = aws_route_table.tf_public_rt.id
}


resource "aws_route_table_association" "tf_public_association2" {
    subnet_id      = aws_subnet.tf_public_subnet2.id
    route_table_id = aws_route_table.tf_public_rt.id
}


resource "aws_route_table_association" "tf_private_association1" {
    subnet_id      = aws_subnet.tf_private_subnet1.id
    route_table_id = aws_route_table.tf_private_rt.id
}


resource "aws_route_table_association" "tf_private_association2" {
    subnet_id      = aws_subnet.tf_private_subnet2.id
    route_table_id = aws_route_table.tf_private_rt.id
}