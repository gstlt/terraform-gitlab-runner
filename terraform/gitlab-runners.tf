data "template_file" "init" {
    template = "${file("scripts/gitlab_runner.sh")}"

    vars {
        gitlab_runners_key = "${var.runners_key}"
    }
}

resource "aws_instance" "gitlabci" {
    ami = "${var.gitlab_ami}"
    instance_type = "${var.runner_instance}"
    subnet_id = "${aws_subnet.public_1a.id}"
    vpc_security_group_ids = [
      "${aws_security_group.gitlab_web_server.id}",
      "${aws_security_group.allow_ssh_ip.id}",
      "${aws_security_group.allow_all_outbound.id}"
    ]
    key_name = "gitlab_key"

    # root device size 50GB
    root_block_device {
        volume_type = "standard"
        volume_size = 50
    }

    count = "${var.runners_count}"

    user_data = "${data.template_file.init.rendered}"

    tags {
        Name = "GitLab runner ${count.index}"
    }
}


