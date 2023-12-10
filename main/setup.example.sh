terraform init
terraform apply

cat <<EOF > ./roles/backend/templates/backend.conf
[database]
MYSQL_HOST = $(ansible-inventory --list | yq ._meta.hostvars.$(ansible-inventory --graph aws_rds | grep terraform | cut -c 6-).endpoint.address)
MYSQL_PORT = 3306
MYSQL_DB = app
MYSQL_USER = example_app_user
MYSQL_PASS = example_app_password
EOF


cat <<EOF > ./roles/backend/defaults/main.yml
---
repository: example_repository
app_user: backend
db_user: example_user
db_pass: example_password
app_user: example_app_user
app_pass: example_app_password
app_host: $(ansible-inventory --list | yq ._meta.hostvars.$(ansible-inventory --graph aws_rds | grep terraform | cut -c 6-).endpoint.address)
EOF


ansible-playbook site.yml
