set -ex

echo '
[devtoolset-12]
name=Devtoolset 12
baseurl=https://buildlogs.centos.org/c7-devtoolset-12.x86_64/
enabled=1
gpgcheck=0
repo_gpgcheck=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7' | tee -a /etc/yum.repos.d/devtoolset-12.repo

yum install -y devtoolset-12
yum -y clean all && rm -rf /var/cache