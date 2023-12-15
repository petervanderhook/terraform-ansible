resource "local_file" "backend_app_db_conf" {
    content = <<EOF
[database]
MYSQL_HOST = ${module.db.db_address}
MYSQL_PORT = 3306
MYSQL_DB = app
MYSQL_USER = ${var.app_user}
MYSQL_PASSWORD = ${var.app_pass}
EOF
  filename = "./roles/backend/templates/backend.conf"
}

resource "local_file" "backend_mainyml" {
    content = <<EOF
---
repository: ${var.repository}
db_user: ${var.db_user}
db_pass: ${var.db_pass}
app_user: ${var.app_user}
app_pass: ${var.app_pass}
app_host: ${module.db.db_address}
EOF
  filename = "./roles/backend/defaults/main.yml"
}

resource "local_file" "web_mainyml" {
    content = <<EOF
---
tls_enabled: true
nginx_conf_path: /etc/nginx/sites-enabled/default
repository: ${var.repository}
EOF
    filename = "./roles/web/defaults/main.yml"
}

resource "local_file" "backend_mycnf" {
    content = <<EOF
[client]
user = ${var.db_user}
port = ${var.db_pass}
host = ${module.db.db_address}
password = ${var.db_pass}
EOF

  filename = "./roles/backend/templates/my.cnf"
}


resource "local_file" "web_default" {
    content = <<EOF
server {
        listen 80 default_server;
        listen [::]:80 default_server;

        root /home/ubuntu/app/frontend;

        server_name _;

        location / {
                try_files $uri $uri/ =404;
        }

        location /json {
                proxy_pass http://${module.ec2_be.ec2_instance_public_dns}:5000;
        }
}
EOF

  filename = "./roles/web/templates/default"
}


