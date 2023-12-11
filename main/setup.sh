terraform init
terraform apply -auto-approve
source list.sh
cat <<EOF > ./roles/backend/templates/backend.conf
[database]
MYSQL_HOST = $HOST
MYSQL_PORT = 3306
MYSQL_DB = app
MYSQL_USER = backend
MYSQL_PASSWORD = securepassword
EOF
cat ./roles/backend/templates/backend.conf

cat <<EOF > ./roles/backend/defaults/main.yml
---
repository: https://github.com/timoguic/acit4640-py-mysql.git
db_user: root
db_pass: password
app_user: backend
app_pass: securepassword
app_host: $HOST
EOF
cat ./roles/backend/defaults/main.yml

cat <<EOF > ./roles/backend/templates/my.cnf
[client]
user = "root"
port = 3306
host = "$HOST"
password = "password"
EOF

cat ./roles/backend/defaults/my.cnf

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
                proxy_pass http://$BACKEND:5000;
        }
}
EOF

cat ./roles/web/templates/default


ansible-playbook site.yml


echo "Connect to your instance in the browser with the WEB address"
echo "WEB: $WEB"
echo "BACKEND: $BACKEND"
echo "RDS: $HOST"
