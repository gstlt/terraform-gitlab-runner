# Number of counters
variable "runners_count" {
    type = "string"
    default = "1"
}

# Instance size
variable "runner_instance" {
    type = "string"
    default = "t2.micro"
}

# SSH key to access runner(s)
variable "runner_ssh_key" {
    type = "string"
}

# Key to register runner in GitlabCI
variable "runners_key" {
    type = "string"
}

# Open SSH to IP address(es)
variable "ssh_access_from_cidr" {
    type = "string"
    default = "123.123.123.123/32"
}

variable "region" {
    type = "string"
    default = "eu-central-1"
}

variable "gitlab_ami" {
    type = "string"
    default = "ami-07a16c68"
}

variable "aws_access_key" {
    type = "string"
}

variable "aws_secret_key" {
    type = "string"
}

