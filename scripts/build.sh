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
yum group install -y "Development Tools"

userdel -f root
if getent group root ; then groupdel root; fi
groupadd -g ${GROUP_ID} root
useradd -l -u ${USER_ID} -g root root
chown -v --no-dereference --recursive \
      --from=0:0 ${USER_ID}:${GROUP_ID} \
      / || true

yum -y clean all && rm -rf /var/cache