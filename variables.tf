###############################################################################
# Variables related to the Student Workstation installation

variable "total_workstations" {
  description = "Total number of student workstations to create"
  default     = "25"
}

variable "workstation_ami" {
  description = "AWS AMI to be used for the student workstation"
#  default     = "ami-44851124" # v1.1
#  default     = "ami-b98214d9" # v1.2
  default     = "ami-9f8e18ff" # v1.3
}

variable "workstation_security_group" {
  description = "AWS Security Group ID to be used for student workstation"
  default     = "sg-2ea34f55"
}

###############################################################################
# Variables related to the Chef Automate installation

variable "automate_ami" {
  description = "AWS AMI to be used for the automate server"
  default     = "ami-d2c924b2"
}

variable "automate_security_group" {
  description = "AWS Security Group ID to be used for the Automate Server"
  default     = "sg-2ea34f55"
}

###############################################################################
# Centralized storage for variables used throughout these terraform scripts.

provider "aws" {
  region = "us-west-2"
}

variable "aws_sshkey" {
  type = "string"
}

variable "ssh_pemfile" {
  type = "string"
}

variable "workshop_prefix" {
  type = "string"
  default = "sirius"
}

variable "contact_tag" {
  type    = "string"
  default = "community"
}

