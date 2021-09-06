provider "aws" {
    region = "us-east-1"
    access_key = "AKIAZOCAGBTZ767OVIOB"
    secret_key = "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"
}

resource "aws_instance" "ec2" {
    ami = "ami-0c2b8ca1dad447f8a"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.webtraffic.name]
}

resource "aws_security_group" "webtraffic" {
    name = "Allow HTTPS"

    ingress {
        from_port = 443
        to_port = 443
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 443
        to_port = 443
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }
}