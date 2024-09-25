output "jenkins_server_ip" {
  value = aws_instance.jenkins-server.public_ip
}

# output "jenkins_initial_password" {
#   value = null_resource.fetch_password.output
# }  

