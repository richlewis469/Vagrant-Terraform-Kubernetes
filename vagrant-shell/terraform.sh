#!/usr/bin/env bash

echo " "
echo "Executing /vagrant-share/vagrant-terraform/Terraform"

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
  terraform plan
  if [ $? -ne 0 ] ; then
    break
  fi
  echo "--Run output-user-demo terraform apply--"
  terraform apply
  if [ $? -ne 0 ] ; then
    break
  fi
  echo "--Run output-user-demo terraform destroy--"
  terraform destroy -auto-approve
  if [ $? -ne 0 ] ; then
    #Sometimes we need sleep for a bit.
    sleep 30
    terraform destroy -auto-approve
  fi
done



echo "Terminating /vagrant-share/vagrant-terraform/Terraform"
