ansible-inventory --graph
echo "$(ansible-inventory --list | yq ._meta.hostvars.$(ansible-inventory --graph aws_rds | grep terraform | cut -c 6-).endpoint.address)"
