#!/bin/bash

CURRENT_DIR=$(dirname "$0")
if [[ "$CURRENT_DIR" == "." ]]; then
	CURRENT_DIR=`pwd`
fi

echo "${CURRENT_DIR}"

docker run --rm -it \
	-e ANSIBLE_CONFIG=/ansible/ansible.cfg \
	-e ANSIBLE_LOG_PATH=/ansible/logs/install_$(date +%Y%m%d_%H%M%S).log \
	--net=host \
	-v $CURRENT_DIR:/ansible \
	alpine/ansible:latest \
	ansible-playbook /ansible/playbook.yml -e playbook_action=install $@