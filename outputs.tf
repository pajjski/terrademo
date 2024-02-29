output "Availability_Domain" {
  description = "We are deploying to AD"
  value = "Availability Domain: ${data.oci_identity_availability_domains.ads.availability_domains[0].name}"
}
output "public_ip" {
  description = "Public IP of compute node"
  value = "Webserver address: http://${data.oci_core_public_ip.public_ip.ip_address}/"
}
