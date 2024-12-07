resource "aws_subnet" "tf_public_subnet1" {
    vpc_id            = aws_vpc.tf_vpc.id
    cidr_block        = "192.168.3.0/24"  # Adjust CIDR as needed
    map_public_ip_on_launch = true     # Enable auto-assignment of public IPs
    availability_zone = "eu-west-3a"   # Adjust for your region
    tags = {
        Name = "PublicSubnet1"
    }
}

resource "aws_subnet" "tf_public_subnet2" {
    vpc_id            = aws_vpc.tf_vpc.id
    cidr_block        = "192.168.4.0/24"  # Adjust CIDR as needed
    map_public_ip_on_launch = true     # Enable auto-assignment of public IPs
    availability_zone = "eu-west-3b"   # Adjust for your region
    tags = {
        Name = "PublicSubnet2"
    }
}

resource "aws_subnet" "tf_private_subnet1" {
    vpc_id            = aws_vpc.tf_vpc.id
    cidr_block        = "192.168.1.0/24"  # Adjust CIDR as needed
    map_public_ip_on_launch = false    # No public IPs assigned
    availability_zone = "eu-west-3a"   # Adjust for your region
    tags = {
        Name = "PrivateSubnet1"
    }
}

resource "aws_subnet" "tf_private_subnet2" {
    vpc_id            = aws_vpc.tf_vpc.id
    cidr_block        = "192.168.2.0/24"  # Adjust CIDR as needed
    map_public_ip_on_launch = false    # No public IPs assigned
    availability_zone = "eu-west-3b"   # Adjust for your region
    tags = {
        Name = "PrivateSubnet2"
    }
}