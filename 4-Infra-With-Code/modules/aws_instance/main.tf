#creating security group for main servers 

resource "aws_security_group" "main_security_group" {
  vpc_id = aws_vpc.main.id

  ingress {

    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.security_group_cidr_range
    description = "used for ssh port"

  }

  ingress {

    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.security_group_cidr_range

  }

  ingress {

    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = var.security_group_cidr_range

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.security_group_cidr_range

  }

  tags = {
    Name = "Main_server"
  }
}


resource "aws_instance" "jenkins-server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = "my-key"
  subnet_id              = aws_subnet.sub-1.id
  vpc_security_group_ids = [aws_security_group.main_security_group.id]
  user_data              = base64encode(file("user_data.sh"))
  tags = {
    Name = "jenkins_server_security_group"
  }
}



resource "null_resource" "fetch_password" {
  depends_on = [aws_instance.jenkins-server]

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      host        = aws_instance.jenkins-server.public_ip
      user        = "ec2-user" # Replace with appropriate user
      private_key = file("~/.ssh/id_rsa") # Replace with your private key path
    }

    # Fetch the password from /tmp/jenkins_password
    inline = [
      "cat /tmp/jenkins_password"
    ]
  }
}




