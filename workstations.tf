# ❤ - hearts - orange cards
module "orange-heart-workstations" {
  source                     = "modules/workstations/"
  suit                       = "hearts"
  color                      = "orange"
  count                      = "${(var.total_workstations > 13) ? "13" : "${max(var.total_workstations,0)}"}"
  automate_fqdn              = "${aws_route53_record.automate.name}"
  aws_sshkey                 = "${var.aws_sshkey}"
  contact_tag                = "${var.contact_tag}"
  workstation_ami            = "${var.workstation_ami}"
  workstation_security_group = "${var.workstation_security_group}"
}

# ♦ - diamonds - orange cards
module "orange-diamonds-workstations" {
  source                     = "modules/workstations/"
  suit                       = "diamonds"
  color                      = "orange"
  count                      = "${(var.total_workstations > 26) ? "13" : "${max(var.total_workstations - 13, 0)}"}"
  automate_fqdn              = "${aws_route53_record.automate.name}"
  aws_sshkey                 = "${var.aws_sshkey}"
  contact_tag                = "${var.contact_tag}"
  workstation_ami            = "${var.workstation_ami}"
  workstation_security_group = "${var.workstation_security_group}"
}

# ♠ - spades - orange cards
module "orange-spades-workstations" {
  source                     = "modules/workstations/"
  suit                       = "spades"
  color                      = "orange"
  count                      = "${(var.total_workstations > 39) ? "13" : "${max(var.total_workstations - 26, 0)}"}"
  automate_fqdn              = "${aws_route53_record.automate.name}"
  aws_sshkey                 = "${var.aws_sshkey}"
  contact_tag                = "${var.contact_tag}"
  workstation_ami            = "${var.workstation_ami}"
  workstation_security_group = "${var.workstation_security_group}"
}

# ♣ - clubs - orange cards
module "orange-clubs-workstations" {
  source                     = "modules/workstations/"
  suit                       = "clubs"
  color                      = "orange"
  count                      = "${(var.total_workstations > 52) ? "13" : "${max(var.total_workstations - 39, 0)}"}"
  automate_fqdn              = "${aws_route53_record.automate.name}"
  aws_sshkey                 = "${var.aws_sshkey}"
  contact_tag                = "${var.contact_tag}"
  workstation_ami            = "${var.workstation_ami}"
  workstation_security_group = "${var.workstation_security_group}"
}

# ❤ - hearts - blue cards
module "blue-heart-workstations" {
  source                     = "modules/workstations/"
  suit                       = "hearts"
  color                      = "blue"
  count                      = "${(var.total_workstations > 65) ? "13" : "${max(var.total_workstations - 52, 0)}"}"
  automate_fqdn              = "${aws_route53_record.automate.name}"
  aws_sshkey                 = "${var.aws_sshkey}"
  contact_tag                = "${var.contact_tag}"
  workstation_ami            = "${var.workstation_ami}"
  workstation_security_group = "${var.workstation_security_group}"
}

# ♦ - diamonds - blue cards
module "blue-diamonds-workstations" {
  source                     = "modules/workstations/"
  suit                       = "diamonds"
  color                      = "blue"
  count                      = "${(var.total_workstations > 78) ? "13" : "${max(var.total_workstations - 65, 0)}"}"
  automate_fqdn              = "${aws_route53_record.automate.name}"
  aws_sshkey                 = "${var.aws_sshkey}"
  contact_tag                = "${var.contact_tag}"
  workstation_ami            = "${var.workstation_ami}"
  workstation_security_group = "${var.workstation_security_group}"
}

# ♠ - spades - blue cards
module "blue-spades-workstations" {
  source                     = "modules/workstations/"
  suit                       = "spades"
  color                      = "blue"
  count                      = "${(var.total_workstations > 91) ? "13" : "${max(var.total_workstations - 78, 0)}"}"
  automate_fqdn              = "${aws_route53_record.automate.name}"
  aws_sshkey                 = "${var.aws_sshkey}"
  contact_tag                = "${var.contact_tag}"
  workstation_ami            = "${var.workstation_ami}"
  workstation_security_group = "${var.workstation_security_group}"
}

# ♣ - clubs - blue cards
module "blue-clubs-workstations" {
  source                     = "modules/workstations/"
  suit                       = "clubs"
  color                      = "blue"
  count                      = "${(var.total_workstations > 104) ? "13" : "${max(var.total_workstations - 91, 0)}"}"
  automate_fqdn              = "${aws_route53_record.automate.name}"
  aws_sshkey                 = "${var.aws_sshkey}"
  contact_tag                = "${var.contact_tag}"
  workstation_ami            = "${var.workstation_ami}"
  workstation_security_group = "${var.workstation_security_group}"
}
