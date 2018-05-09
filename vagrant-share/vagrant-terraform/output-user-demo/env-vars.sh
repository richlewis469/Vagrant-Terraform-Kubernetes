export TF_VAR_tenancy_ocid=`cat /vagrant-share/.oci-auth/ocid_tenancy`
export TF_VAR_compartment_ocid=`cat /vagrant-share/.oci-auth/ocid_compartment`
export TF_VAR_user_ocid=`cat /vagrant-share/.oci-auth/ocid_user`
export TF_VAR_fingerprint=`cat /vagrant-share/.oci-auth/oci_api_key_public.fingerprint`
export TF_VAR_private_key_path="/vagrant-share/.oci-auth/oci_api_key.pem"
export TF_VAR_region="us-ashburn-1"
