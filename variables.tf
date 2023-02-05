variable "ami" {
  description = "Amazon Machine Image to use for the EC2 instance"
  type        = string
  default     = "ami-0778521d914d23bc1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "access_key" {
  description = "AWS account accesss key"
}

variable "secret_key" {
  description = "AWS account secret key"
}
