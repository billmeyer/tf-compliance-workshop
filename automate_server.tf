resource "null_resource" "delivery_client_key" {
  provisioner "local-exec" {
    command = "openssl genrsa -out delivery.pem 2048"
  }
}

resource "aws_instance" "automate" {
  ami                    = "${var.automate_ami}"
  key_name               = "${var.aws_sshkey}"
  instance_type          = "m4.4xlarge"
  vpc_security_group_ids = ["${var.automate_security_group}"]

  root_block_device {
    volume_size = 60
  }

  tags {
    X-Dept    = "Eng"
    X-Contact = "${var.contact_tag}"
    Name      = "${var.workshop_prefix}-workshop-automate"
  }

  depends_on = ["null_resource.delivery_client_key"]

  connection {
    type = "ssh"
    user = "centos"
    timeout = "2m"
    private_key = "${file(var.ssh_pemfile)}"
    agent = false
  }

  provisioner "file" {
    source      = "delivery.pem"
    destination = "/tmp/delivery.pem"
  }

  provisioner "file" {
    source      = "./delivery.license"
    destination = "/tmp/delivery.license"
  }

  provisioner "remote-exec" {
    inline = [
      "curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -P automate -v 1.5.46",
      "sudo automate-ctl setup --license /tmp/delivery.license --fqdn ${var.workshop_prefix}-workshop.${data.aws_route53_zone.chefdemo.name} --key /tmp/delivery.pem --server-url https://fake-chef-server.chefdemo.net/organizations/chef --enterprise chef --no-build-node --configure",
      "sudo automate-ctl create-user chef chef --password chef --roles admin",
    ]
  }
}
