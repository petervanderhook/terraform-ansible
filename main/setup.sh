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

ansible-playbook site.yml


echo "Connect to your instance in the browser with the WEB address"
echo "WEB: $WEB"
echo "BACKEND: $BACKEND"
echo "RDS: $HOST"
