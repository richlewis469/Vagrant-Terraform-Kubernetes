#!/usr/bin/env bash
# Dependencies: Terraform
echo " "
echo "Executing Kubernetes Setup"

yum install git --assumeyes
yum install kubectl --assumeyes

git clone https://github.com/oracle/terraform-kubernetes-installer.git

#terraform init
#terraform plan
#terraform apply
#terraform destroy

echo "Terminating Kubernetes Setup"
