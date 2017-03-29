variable "automate_ami" {
  description = "AWS AMI to be used for the automate server"
  default     = "ami-d2c924b2"
}

variable "automate_security_group" {
  description = "AWS Security Group ID to be used for the Automate Server"
  default     = "sg-d36252b4"
}

variable "total_workstations" {
  description = "Total number of student workstations to create"
  default     = "25"
}

variable "workstation_ami" {
  description = "AWS AMI to be used for the student workstation"
  default     = "ami-7173fd11"
}

variable "workstation_security_group" {
  description = "AWS Security Group ID to be used for student workstation"
  default     = "sg-d36252b4"
}

output "Total Workstations" {
  value = "${var.total_workstations}"
}
