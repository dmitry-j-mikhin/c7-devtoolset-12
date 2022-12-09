#!/bin/bash

set -ex

echo '
[devtoolset-12]
name=Devtoolset 12
baseurl=https://buildlogs.centos.org/c7-devtoolset-12.x86_64/
enabled=1
gpgcheck=0
repo_gpgcheck=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7' | tee -a /etc/yum.repos.d/devtoolset-12.repo

yum install -y devtoolset-12 sudo
yum group install -y "Development Tools"

groupadd -g ${GROUP_ID} cicd
useradd -m -l -u ${USER_ID} -G wheel -g cicd cicd
echo '%wheel ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers.d/wheel_group
echo 'Defaults:%wheel !requiretty' >> /etc/sudoers.d/wheel_group

yum -y clean all && rm -rf /var/cache