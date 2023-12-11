#terraform init
#terraform apply

cat <<EOF > ./roles/backend/templates/backend.conf
[database]
MYSQL_HOST = $(ansible-inventory --list | yq ._meta.hostvars.$(ansible-inventory --graph aws_rds | grep terraform | cut -c 6-).endpoint.address)
MYSQL_PORT = 3306
MYSQL_DB = app
MYSQL_USER = root
MYSQL_PASS = password
EOF


cat <<EOF > ./roles/backend/defaults/main.yml
---
repository: https://github.com/timoguic/acit4640-py-mysql.git
db_host: $(ansible-inventory --list  | yq .backend.hosts[0])
db_user: root
db_pass: password
app_user: backend
app_pass: securepassword
app_host: $(ansible-inventory --list | yq ._meta.hostvars.$(ansible-inventory --graph aws_rds | grep terraform | cut -c 6-).endpoint.address)
EOF


cat <<EOF > ./roles/backend/defaults/.my.cnf
[client]
user="root"
port=3306
host=$(ansible-inventory --list | yq ._meta.hostvars.$(ansible-inventory --graph aws_rds | grep terraform | cut -c 6-).endpoint.address)
password="password"
EOF


ansible-playbook site.yml
