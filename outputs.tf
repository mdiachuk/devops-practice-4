output "instance_ips" {
  value = [for i in aws_instance.postgresql_instance : i.public_ip]
}
