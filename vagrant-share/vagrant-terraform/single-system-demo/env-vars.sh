### Authentication details
export TF_VAR_tenancy_ocid=`cat /vagrant-share/.oci-auth/ocid_tenancy`
export TF_VAR_user_ocid=`cat /vagrant-share/.oci-auth/ocid_user`
export TF_VAR_fingerprint=`cat /vagrant-share/.oci-auth/oci_api_key_public.fingerprint`
export TF_VAR_private_key_path="/vagrant-share/.oci-auth/oci_api_key.pem"

### Region
export TF_VAR_region="us-ashburn-1"

### Compartment
export TF_VAR_compartment_ocid=`cat /vagrant-share/.oci-auth/ocid_compartment`


### Public/private keys used on the instance
export TF_VAR_ssh_public_key_path="/vagrant-share/.oci-auth/oci_trial_ssh_key.pub"
export TF_VAR_ssh_public_key=$(cat $TF_VAR_ssh_public_key_path)
export TF_VAR_ssh_private_key_path="/vagrant-share/.oci-auth/oci_trial_ssh_key"
export TF_VAR_ssh_private_key=$(cat $TF_VAR_ssh_private_key_path)
## NOTE: These are not your api keys. More info on the right keys see
## https://docs.us-phoenix-1.oraclecloud.com/Content/Compute/Tasks/managingkeypairs.htm
