
terraform init
terraform apply -auto-approve

echo "INITIALIZING TERRAFORM"
terraform -chdir=main init

echo "APPLYING TERRAFORM FILES"
terraform -chdir=main apply -auto-approve

HOST="$(ansible-inventory -i "./main" --list | yq ._meta.hostvars.$(ansible-inventory -i "./main" --graph aws_rds | grep terraform | cut -c 6-).endpoint.address)"
BACKEND="$(ansible-inventory -i "./main" --list  | yq .backend.hosts[0])"
WEB="$(ansible-inventory -i "./main" --list  | yq .web.hosts[0])"

echo "RUNNING ANSIBLE PLAYBOOK"
ansible-playbook -i "./main" site.yml


echo Connect to your instance in the browser with the WEB address
echo WEB: $WEB
echo BACKEND: $BACKEND
echo RDS: $HOST
