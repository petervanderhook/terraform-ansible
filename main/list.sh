HOST="$(ansible-inventory --list | yq ._meta.hostvars.$(ansible-inventory --graph aws_rds | grep terraform | cut -c 6-).endpoint.address)"
BACKEND="$(ansible-inventory --list  | yq .backend.hosts[0])"
WEB="$(ansible-inventory --list  | yq .web.hosts[0])"

