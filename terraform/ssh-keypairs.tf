resource "aws_key_pair" "gitlab_key" {
  key_name = "gitlab_key" 
  public_key = "${var.runner_ssh_key}"
}
