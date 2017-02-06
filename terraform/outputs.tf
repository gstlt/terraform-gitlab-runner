output "runners_ec2_ip_address" {
  value = ["${join(",", aws_instance.gitlabci.*.public_ip)}"]
}

