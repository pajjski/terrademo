output "Availability_Domain" {
  description = "We are deploying to AD"
  value = "${data.oci_identity_availability_domains.ads.availability_domains[0].name}"
}
output "Webserver_IP" {
  description = "Public IP of compute node"
  value = "http://${data.oci_core_public_ip.public_ip.ip_address}/"
}
