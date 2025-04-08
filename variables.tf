variable "instance_count" {
  description = "The number of EC2 instances to create"
  type        = number
  default     = 2
}

variable "instance_image" {
  description = "The AMI ID to use for the EC2 instances"
  type        = string
  default     = "ami-0c1ac8a41498c1a9c"
}

variable "instance_size" {
  description = "The size of the EC2 instance"
  type        = string
  default     = "t3.small"
}

variable "key_pair" {
  description = "The name of the key pair to use for SSH access"
  type        = string
  default     = "first-keypair"
}


variable "public_key_url" {
  description = "URL to the public key for SSH access"
  type        = string
  default     = "https://github.com/bkmz/my_public_key/raw/main/id_ed25519.pub"
}
