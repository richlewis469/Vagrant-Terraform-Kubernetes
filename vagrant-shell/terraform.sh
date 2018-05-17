#!/usr/bin/env bash

echo " "
echo "Executing /vagrant-share/vagrant-terraform/Terraform"

# https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/credentials.htm
# yum install openssh --assumeyes

# API Signing Key
# openssl genrsa -out /vagrant-share/.oci-auth/oci_api_key.pem 2048
# chmod go-rwx /vagrant-share/.oci-auth/oci_api_key.pem
# openssl rsa -pubout -in /vagrant-share/.oci-auth/oci_api_key.pem -out /vagrant-share/.oci-auth/oci_api_key_public.pem
# openssl rsa -pubout -outform DER -in /vagrant-share/.oci-auth/oci_api_key.pem | openssl md5 -c >> /vagrant-share/.oci-auth/oci_api_key_public.fingerprint

# Create SSH Key pair
# https://docs.us-phoenix-1.oraclecloud.com/Content/Compute/Tasks/managingkeypairs.htm
# ssh-keygen -t rsa -N "" -b 2048 -C "oci_trial_ssh_key" -f /vagrant-share/.oci-auth/oci_trial_ssh_key

echo "--Remove any trailing \r dos characters--"
cd /vagrant-share
for i in `find . -type f -print | file -f - | grep -v binary | grep -v gitkeep | grep CRLF | sed -e "s/\:.*$//"`; do
  dos2unix ${i}
done

cd /vagrant-share/vagrant-terraform
for i in `ls -1`; do
  echo "--Setup the $i environment variables--"
  cd /vagrant-share/vagrant-terraform/$i
  source env-vars.sh
  printenv | \
  grep -i TF_VAR | \
    sed '/ocid=/s/\.\.\(.\{10\}\).*/\.\.\1\**************************************************/' | \
    sed '/fingerprint=/s/=\(.\{15\}\).*/=\1**:**:**:**:**:**:**:**:**:**:**/' | \
    sort
  echo "--Run output-user-demo terraform init--"
  terraform init
  if [ $? -ne 0 ] ; then
    break
  fi
  echo "--Run output-user-demo terraform plan--"
  terraform plan | tee terraform-plan.out
  if [ $? -ne 0 ] ; then
    break
  fi
  echo "--Run output-user-demo terraform apply--"
  terraform apply -auto-approve | tee terraform-apply.out
  if [ $? -ne 0 ] ; then
    break
  fi
  echo "--Run output-user-demo terraform destroy--"
  terraform destroy -auto-approve | tee terraform-destroy.out
  if [ $? -ne 0 ] ; then
    #Sometimes we need sleep for a bit.
    sleep 30
    date >> terraform-destroy.out
    terraform destroy -auto-approve | tee -a terraform-destroy.out
  fi
done



echo "Terminating /vagrant-share/vagrant-terraform/Terraform"
