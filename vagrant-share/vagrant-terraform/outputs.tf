# Normally you might want to get element [0], but I know my record is [25]
# References:
#    https://github.com/oracle/terraform-provider-oci
#    https://github.com/oracle/terraform-provider-oci/blob/master/docs/datasources/identity/user.md

output "user_id" {
  value = "${lookup(data.oci_identity_users.Users.users[25], "name")}"
}

output "user_id_data" {
  value = "${data.oci_identity_users.Users.users[25]}"
}

output "number_of_user_ids" {
  value = "${length(data.oci_identity_users.Users.users)}"
}
