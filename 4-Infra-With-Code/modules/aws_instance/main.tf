


resource "aws_instance" "jenkins-server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = "my-key"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  user_data              = base64encode(file("~/Angular-Frontend-SpringBoot-Backend-Deployment/4-Infra-With-Code/modules/aws_instance/user_data.sh"))
  tags = {
    Name = "jenkins_server_security_group"
  }
}








# resource "null_resource" "fetch_password" {
#   depends_on = [aws_instance.jenkins-server]

#   provisioner "remote-exec" {
#     connection {
#       type        = "ssh"
#       host        = aws_instance.jenkins-server.public_ip
#       user        = "ec2-user" # Replace with appropriate user
#       private_key = file("~/.ssh/id_ed25519") # Replace with your private key path
#     }

#     # Fetch the password from /tmp/jenkins_password
#     inline = [
#       "cat /tmp/jenkins_password"
#     ]
#   }
# }




