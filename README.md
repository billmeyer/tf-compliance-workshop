# Compliance Workshop Setup

## Things you'll need

 * a valid `delivery.license` file in this directory

## Running the thing

This is all configured for the `us-west-2` region of EC2.

1. Set environment variables:

    Assuming I want my automate hostname prefixed with `acme` and my AWS EC2 SSH keypair is named `mykeynamehere`:

    ```
    export TF_VAR_workshop_prefix="acme"
    export TF_VAR_aws_sshkey="mykeynamehere"
    export TF_VAR_ssh_pemfile="/Users/<user>/.ssh/<pemfile.pem>
    ```

2. Confirm the plan:

    Make sure that the expected number of workstations are created, etc.

    ```
    $ terraform plan
    ```

3. Apply the plan:

    ```
    $ terraform apply
    ```

4. Verify workstation IP addresses:

    ```
    $ ./parse-state.rb terraform.tfstate
    | Workstation | IP Address |
    | ----------- | ---------- |
    | acme-workshop-automate | 34.223.206.74 |
    | hearts - 02 | 35.160.188.138 |
    | hearts - 03 | 52.39.49.122 |
    | hearts - 04 | 52.37.47.234 |
    ```

## Variables

User-configurable variables can be found in the `variables.tf` file.

|Variable|Environment Variable|Description|
|---|---|---|
|`prefix`|`TF_VAR_prefix`|The prefix to be used in hostnames.  __example__: if prefix is `acme`, the automate server FQDN will be: __acme-workshop.chefdemo.net__|
|`aws_sshkey`|`TF_VAR_aws_sshkey`|Name of the EC2 ssh key to set up for access|
|`ssh_pemfile`|`TF_VAR_ssh_pemfile`|The pem file to be assigned to the new AWS EC2 instance such that Terraform doesn't get hung up on validating the SSH Fingerprint (most desktops don't add additional SSH keys to their __ssh-agent__)|
|`contact_tag`|`TF_VAR_contact_tag`|default: `community` - the value to set for the __X-Contact__ tag|
|`total_workstations`|`TF_VAR_workstations`|The total number of student workstations (plus one for the instructor) that should be started.  The TF scripts will spawn that number of workstations using the minimum number of decks and suits as possible.|

## Automate Server

 * An automate server will be set up as `PREFIX-workshop.chefdemo.net`
 * Username: __chef__ / Password: __chef__

## Workstations

The workstation setup assumes you're using playing cards to assign workstations to users.



