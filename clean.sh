
echo "CLEANING UNECESSARY FILES"
rm -rf .terraform
rm -rf .terraform.lock.hcl
rm -rf main/.terraform
rm -rf main/.terraform.lock.hcl
rm -rf terraform.tfstate
rm -rf terraform.tfstate.backup
rm -rf *.tfstate*
rm -rf main/*.tfstate*
rm -rf main/backend_config.tf
rm -rf main/roles/backend/templates/backend.conf
rm -rf main/roles/web/templates/default
rm -rf main/roles/backend/templates/my.cnf
rm -rf main/roles/web/defaults/main.yml
rm -rf main/roles/backend/defaults/main.yml
echo "FILES REMOVED"
sleep 3
