# OCI authentication

tenancy_ocid = "ocid1.tenancy.oc1..aaaaaaaajmnesn64chftx3bzhbck7pnxwnqhuzm7w5r7la5g6h6kcsfu2ysq"
compartment_ocid = "ocid1.compartment.oc1..aaaaaaaagveanetm6dsagqgvn4vbqlhcgf4tvfcqlxbqmr65wbk76rku7xua"
fingerprint = "62:c4:fd:31:bd:44:7b:73:d1:49:44:c3:56:be:ad:66"
private_key_path = "/vagrant-share/.oci-auth/oci_api_key.pem"
user_ocid = "ocid1.user.oc1..aaaaaaaaswzrkthvixrdwmdbsoqni5yj5nl5dbbdpwwl2apset73nrzkmbya"
region = "us-ashburn-1"

# CCM user

cloud_controller_user_ocid = "ocid1.tenancy.oc1..aaaaaaaajmnesn64chftx3bzhbck7pnxwnqhuzm7w5r7la5g6h6kcsfu2ysq"
cloud_controller_user_fingerprint = "62:c4:fd:31:bd:44:7b:73:d1:49:44:c3:56:be:ad:66"
cloud_controller_user_private_key_path = "/vagrant-share/.oci-auth/oci_api_key.pem"

etcdShape = "VM.Standard1.2"
k8sMasterShape = "VM.Standard1.1"
k8sWorkerShape = "VM.Standard1.2"

etcdAd1Count = "1"
etcdAd2Count = "0"
etcdAd3Count = "0"

k8sMasterAd1Count = "1"
k8sMasterAd2Count = "0"
k8sMasterAd3Count = "0"

k8sWorkerAd1Count = "1"
k8sWorkerAd2Count = "0"
k8sWorkerAd3Count = "0"

#etcdLBShape = "100Mbps"
#k8sMasterLBShape = "100Mbps"

#etcd_ssh_ingress = "10.0.0.0/16"
etcd_ssh_ingress = "0.0.0.0/0"
#etcd_cluster_ingress = "10.0.0.0/16"
etcd_cluster_ingress = "0.0.0.0/0"
#master_ssh_ingress = "10.0.0.0/16"
master_ssh_ingress = "0.0.0.0/0"
#worker_ssh_ingress = "10.0.0.0/16"
worker_ssh_ingress = "0.0.0.0/0"
#master_https_ingress = "10.0.0.0/16"
master_https_ingress = "0.0.0.0/0"
#worker_nodeport_ingress = "10.0.0.0/16"
worker_nodeport_ingress = "0.0.0.0/0"

control_plane_subnet_access = "public"
k8s_master_lb_access = "public"
natInstanceShape = "VM.Standard1.2"
nat_instance_ad1_enabled = "true"
nat_instance_ad2_enabled = "false"
nat_instance_ad3_enabled = "false"
nat_ssh_ingress = "0.0.0.0/0"
#public_subnet_http_ingress = "0.0.0.0/0"
#public_subnet_https_ingress = "0.0.0.0/0"

#worker_iscsi_volume_create is a bool not a string
#worker_iscsi_volume_create = true
#worker_iscsi_volume_size = 100

#etcd_iscsi_volume_create = true
#etcd_iscsi_volume_size = 50
