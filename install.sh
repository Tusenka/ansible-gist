#!/usr/bin/env bash
set -eu

title() {
    local color='\033[1;37m'
    local nc='\033[0m'
    printf "\n${color}$1${nc}\n"
}

title "Install pip and Ansible"
sudo dnf python3-pip -y
sudo pip3 install ansible

title "Install viasite-ansible.zsh"
ansible-galaxy install ansible-gist.zsh --force

title "Copy playbook to /tmp/zsh.yml"
curl cp ./playbook.yml > /tmp/playground.yml

title "Provision playbook for root"
ansible-playbook -i "localhost," -c local -b /tmp/playground.yml

title "Provision playbook for $(whoami)"
ansible-playbook -i "localhost," -c local -b /tmp/playground.yml --extra-vars="zsh_user=$(whoami)"

title "Finished! Please, restart your shell."
echo ""
