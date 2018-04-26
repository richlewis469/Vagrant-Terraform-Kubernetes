# References:
#    https://github.com/oracle/terraform-provider-oci/blob/master/docs/datasources/identity/user.md

data "oci_identity_users" "Users" {
  compartment_id = "${var.tenancy_ocid}"
}
