#!/bin/bash

if ! grep -q ${SSH_USERNAME} /etc/group &> /dev/null; then
	addgroup ${SSH_USERNAME}
fi

if ! id "${SSH_USERNAME}" &> /dev/null; then
	adduser --home /home/kubot --ingroup ${SSH_USERNAME} ${SSH_USERNAME}
fi

echo -e "${SSH_PASSWORD}\n${SSH_PASSWORD}" | passwd ${SSH_USERNAME}
chown -R ${SSH_USERNAME} /home/kubot

service ssh start

tail -f /dev/null
