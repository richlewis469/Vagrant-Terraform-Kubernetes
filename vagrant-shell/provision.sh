#!/usr/bin/env bash

# Enable provisioning of the client with a shell script.
echo "Entering Shell Provisoning"
/bin/rm /etc/yum.repos.d/epel.repo /etc/yum.repos.d/epel-testing.repo
yum makecache fast
yum install deltarpm -y
yum install wget -y

/bin/mv /etc/yum.repos.d/public-yum-ol7.repo /etc/yum.repos.d/public-yum-ol7.repo.orig
wget -q http://yum.oracle.com/public-yum-ol7.repo -P /etc/yum.repos.d

yum install yum-utils -y
yum-config-manager --enable ol7_addons
yum-config-manager --enable ol7_software_collections
yum-config-manager --enable ol7_developer
yum-config-manager --enable ol7_developer_EPEL

yum makecache fast

yum install dos2unix -y
yum install terraform -y

cd /tmp
wget -q https://github.com/oracle/terraform-provider-oci/releases/download/v2.0.1/linux.tar.gz -O /tmp/linux.tar.gz
tar xf /tmp/linux.tar.gz
sudo cp /tmp/linux_amd64/terraform-provider-oci_v2.0.1 /usr/bin/terraform-provider-oci

echo " "
ip addr show


date +"%F %T" > /etc/git-creation-timestamp.txt
echo " "
cat /etc/git-creation-timestamp.txt
echo " "
echo "Exiting Shell Provisoning"
