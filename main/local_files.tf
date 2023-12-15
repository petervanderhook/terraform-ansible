resource "local_file" "backend_app_db_conf" {
    content = <<EOF
[database]
MYSQL_HOST = $HOST
MYSQL_PORT = 3306
MYSQL_DB = app
MYSQL_USER = backend
MYSQL_PASSWORD = securepassword
EOF
  filename = "./roles/backend/templates/backend.conf"
}

resource "local_file" "backend_main.yml" {
    content = <<EOF
---
repository: https://github.com/timoguic/acit4640-py-mysql.git
db_user: root
db_pass: password
app_user: backend
app_pass: securepassword
app_host: $HOST
EOF
  filename = "./roles/backend/defaults/main.yml"
}


resource "local_file" "backend_mycnf" {
    content = <<EOF
[client]
user = "root"
port = 3306
host = "$HOST"
password = "password"
EOF

  filename = "./roles/backend/defaults/my.cnf"
}


resource "local_file" "web_default" {
    content = <<EOF
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

  filename = "./roles/web/templates/default"
}

