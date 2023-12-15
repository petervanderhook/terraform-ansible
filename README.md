
# Terraform Ansible Project

This project initially sets up an RDS, backend ec2, and frontend ec2 instance using Terraform modules. Once completed, ansible playbooks will set up the applications on the frontend and backend instances, and configure the connections the the rds instance.

# Setup
Ensure all your variables in the following files are configured properly as per your aws cli configurations.  
\variables.tf  
\main\variables.tf  
\main\terraform.tfvars   
\main\mods\terraform_ec2_simple\variables.tf (ssh_key_name)   
\main\mods\terraform_sg_simple\variables.tf  
\main\mods\terraform_vpc_simple\variables.tf (change from 0.0.0.0)

# Run Instructions
Ensure the following tools are installed
*terraform*
*ansible-inventory*
*ansible-playbook*
**In Root Project Directiory**   
**RUN SCRIPT:** *setup.sh*   

**CONNECT TO YOUR NEW SERVER AT THE ADDRESS PROVIDED**







