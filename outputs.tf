output "jenkins_url" {
  value = "http://${module.ec2_instance.public_ip}:8080"
}