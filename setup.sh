
clear
echo "INITIALIZING TERRAFORM IN ROOT"
sleep 1
terraform init

clear
echo "APPLYING TERRAFORM FILES in ROOT"
sleep 1
terraform apply -auto-approve
echo "FINISHED APPLYING TERRAFORM FILES IN ROOT"
sleep 1

clear
echo "INITIALIZING TERRAFORM IN /MAIN"
sleep 1
terraform -chdir=main init
sleep 1

clear
echo "APPLYING TERRAFORM FILES in /MAIN"
sleep 1
terraform -chdir=main apply -auto-approve
sleep 1
echo "FINISHED APPLYING TERRAFORM FILES IN /MAIN"
sleep 1

clear
echo "FETCHING HOST VARS"
sleep 1
HOST="$(ansible-inventory -i "./main" --list | yq ._meta.hostvars.$(ansible-inventory -i "./main" --graph aws_rds | grep terraform | cut -c 6-).endpoint.address)"
BACKEND="$(ansible-inventory -i "./main" --list  | yq .backend.hosts[0])"
WEB="$(ansible-inventory -i "./main" --list  | yq .web.hosts[0])"

clear
echo "RUNNING ANSIBLE PLAYBOOK"
sleep 1
ansible-playbook -i main/inventory/ main/site.yml
echo "FINISHED RUNNING ANSIBLE PLAYBOOK"
sleep 1

clear
echo Connect to your instance in the browser with the WEB address
echo WEB: $WEB
echo BACKEND: $BACKEND
echo RDS: $HOST
