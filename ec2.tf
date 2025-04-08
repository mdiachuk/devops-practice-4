resource "aws_security_group" "postgresql_sg" {
  name        = "postgresql-sg"
  description = "Security group to allow SSH traffic from anywhere and PostgreSQL (TCP) traffic from the same security group"

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 5432
    to_port   = 5435
    protocol  = "tcp"
    security_groups = [aws_security_group.postgresql_sg.id]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "postgresql_instance" {
  count = var.instance_count

  ami             = var.instance_image
  instance_type   = var.instance_size
  security_groups = [aws_security_group.postgresql_sg.name]
  key_name        = var.key_pair
  user_data       = templatefile("${path.module}/user_data.sh.tmpl", {
    public_key_url = var.public_key_url
  })

  tags = {
    Name = "practice-4-instance-${count.index + 1}"
  }
}
