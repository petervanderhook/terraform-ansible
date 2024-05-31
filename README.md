
# Terraform Ansible Project

This project, utilizing AWS, initially sets up an RDS, backend ec2, and frontend ec2 instance using Terraform modules. Once completed, ansible playbooks will set up the applications on the frontend and backend instances, and configure the connections the the rds instance.

To automate setup, a bash script has been provided named setup.sh

# Setup

**CAUTION: THESE FILES ARE REQUIRED.**
Please configure the following files and then remove the .EXAMPLE extension
\variables.tf.EXAMPLE
\main\variables.tf.EXAMPLE
\main\terraform.tfvars.EXAMPLE

**Ensure the following software is installed**
*terraform*
*ansible-inventory*
*ansible-playbook*

# Run Instructions
**In Root Project Directiory**   
**RUN SCRIPT:** *setup.sh*   

**CONNECT TO YOUR NEW SERVER AT THE ADDRESS PROVIDED AS 'WEB'**







