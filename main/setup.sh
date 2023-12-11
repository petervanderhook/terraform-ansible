terraform init
terraform apply -auto-approve
cat <<EOF > ./roles/backend/templates/backend.conf
[database]
MYSQL_HOST = $(ansible-inventory --list | yq ._meta.hostvars.$(ansible-inventory --graph aws_rds | grep terraform | cut -c 6-).endpoint.address)
MYSQL_PORT = 3306
MYSQL_DB = app
MYSQL_USER = backend
MYSQL_PASSWORD = securepassword
EOF
cat ./roles/backend/templates/backend.conf

cat <<EOF > ./roles/backend/templates/main.yml
---
repository: https://github.com/timoguic/acit4640-py-mysql.git
db_host: $(ansible-inventory --list  | yq .backend.hosts[0])
db_user: root
db_pass: password
app_user: backend
app_pass: securepassword
app_host: $(ansible-inventory --list | yq ._meta.hostvars.$(ansible-inventory --graph aws_rds | grep terraform | cut -c 6-).endpoint.address)
EOF
cat ./roles/backend/defaults/main.yml

cat <<EOF > ./roles/backend/templates/.my.cnf
[client]
user="root"
port=3306
host=$(ansible-inventory --list | yq ._meta.hostvars.$(ansible-inventory --graph aws_rds | grep terraform | cut -c 6-).endpoint.address)
password="password"
EOF

cat ./roles/backend/defaults/.my.cnf

cat <<EOF > ./roles/web/templates/default
server {
        listen 80 default_server;
        listen [::]:80 default_server;

        root /home/ubuntu/app/frontend;

        server_name _;

        location / {
                try_files \$uri \$uri/ =404;
        }

        location /json {
                proxy_pass http://$(ansible-inventory --list  | yq .backend.hosts[0]):5000;
        }
}
EOF

cat ./roles/web/templates/default

bash list.sh

ansible-playbook site.yml


echo "Connect to your instance with the following address:"
echo "$(ansible-inventory --list  | yq .backend.hosts[0])"
