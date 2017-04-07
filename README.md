# Compliance Workshop Setup

## Things you'll need

 * a valid `delivery.license` file in this directory

## Running the thing

This is all configured for the us-west region of EC2.

Assuming I want my automate hostname prefixed with `scale` and my AWS EC2 SSH keypair is named `mykeynamehere`:

```
export TF_VAR_workshop_prefix="sirius"
export TF_VAR_aws_sshkey="mykeynamehere"
export TF_VAR_ssh_pemfile="/Users/<user>/.ssh/<pemfile.pem>

terraform plan     # make sure that the expected number of workstations are created, etc.
terraform apply
ruby ./parse-state.rb terraform.tfstate
```

## Variables

 * prefix (env var: TF_VAR_prefix): the prefix to be used in hostnames
    * example: if prefix is "chi", the automate server FQDN will be: `chi-compliance-workshop.chefdemo.net`
 * aws_sshkey (env var: TF_VAR_aws_sshkey): name of the EC2 ssh key to set up for access
 * ssh_pemfile (env var: TF_VAR_ssh_pemfile): the pem file to be assigned to the new AWS EC2 instance such that Terraform doesn't get hung up on validating the SSH Fingerprint (most desktops don't add additional SSH keys to their __ssh-agent__)
 * contact_tag (env var: TF_VAR_contact_tag -- default: 'community'): the value to set for the X-Contact tag

## Automate Server

 * An automate server will be set up as `PREFIX-compliance-workshop.chefdemo.net`
 * Username: chef / Password: chef

## Workstations

The workstation setup assumes you're using playing cards to assign workstations to users.

In `variables.tf`, change the __total_workstations__ variable to reflect the total number of student workstations (plus one for the instructor) that should be started by Terraform.  The TF scripts will spawn that number of workstations using the minimum number of decks and suits as possible.

