resource "oci_identity_compartment" "container" {
  compartment_id = var.source_compartment_ocid 
  description = var.target_compartment_description 
  name = var.target_compartment 
}
