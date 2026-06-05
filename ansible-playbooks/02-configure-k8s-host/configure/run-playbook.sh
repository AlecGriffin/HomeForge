# ansible-playbook  -i inventory.yaml playbook-k8s-configuration.yaml
export ANSIBLE_STDOUT_CALLBACK=debug
# export ANSIBLE_STDOUT_CALLBACK=yaml
ansible-playbook -K -i ../../inventory.yaml playbook.yaml