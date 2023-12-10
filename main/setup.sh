#terraform init
#terraform apply

cat <<EOF > ./roles/backend/templates/backend.conf
[database]
MYSQL_HOST = $(ansible-inventory --list | yq ._meta.hostvars.$(ansible-inventory --graph aws_rds | grep terraform | cut -c 6-).endpoint.address)
MYSQL_PORT = 3306
MYSQL_DB = app
MYSQL_USER = backend
MYSQL_PASS = securepassword
EOF


cat <<EOF > ./roles/backend/defaults/main.yml
---
repository: https://github.com/timoguic/acit4640-py-mysql.git
app_user: backend
db_user: root
db_pass: password
app_user: backend
app_pass: securepassword
app_host: $(ansible-inventory --list | yq ._meta.hostvars.$(ansible-inventory --graph aws_rds | grep terraform | cut -c 6-).endpoint.address)
EOF


ansible-playbook site.yml
