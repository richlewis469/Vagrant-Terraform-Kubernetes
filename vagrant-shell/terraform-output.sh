#!/usr/bin/env bash

echo " "
echo "Executing /vagrant-share/vagrant-terraform/Terraform"

echo "--Remove any trailing \r dos characters--"
cd /vagrant-share
for i in `find . -type f -print | file -f - | grep -v binary | grep -v gitkeep | grep CRLF | sed -e "s/\:.*$//"`; do
  dos2unix ${i}
done

echo "--Setup the environment variables--"
cd /vagrant-share/vagrant-terraform
source /vagrant-share/vagrant-terraform/env-vars.sh

printenv | \
grep -i TF_VAR | \
sed '/ocid=/s/\.\.\(.\{10\}\).*/\.\.\1\**************************************************/' | \
sed '/fingerprint=/s/=\(.\{15\}\).*/=\1**:**:**:**:**:**:**:**:**:**:**/' | \
sort

echo "--Run terraform init--"
terraform init
echo "--Run terraform plan--"
terraform plan
echo "--Run terraform apply--"
terraform apply

echo "Terminating /vagrant-share/vagrant-terraform/Terraform"
