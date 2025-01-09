#!/bin/bash

/usr/libexec/oci-growfs -y

yum install -y yum-utils
yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
yum -y install terraform

/bin/python -m pip install oci-cli

mkdir -p /home/opc/actions-runner 
cd /home/opc/actions-runner
chown opc:opc /home/opc/actions-runner

wget ${filename} -O actions-runner-x64.tar.gz
chown opc:opc actions-runner-x64.tar.gz
sudo -u opc tar zxvf actions-runner-x64.tar.gz

sudo -u opc sh config.sh --unattended --url ${url} --token ${token} --runnergroup ${runnergroup} > config.out

sudo -u opc nohup sh run.sh > nohup.out