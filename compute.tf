variable compute_name {
    type = string
    default = ""
    description = "Friendly name of compute host"
}
variable instance_shape {
    type = string
    default = ""
    description = "The shape of the VM"
}
variable image_ocid {
    type = string
    default = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaaxuo6wss32vwjxkyshsvjm2yrysep5axzhe4dpuozf32x5siistsq"
    description = "ocid of the image you want to run"

}
variable image_compartment {
    type = string
    default = "ocid1.compartment.oc1..aaaaaaaaff75tp2hk7vj4ixhlrf5ovqgzywpzjzfiiq2ssdvuwb2zhammbdq"
    description = "Which compartment the images is stored in"
}

resource "oci_core_instance" "compute_instance" {
    display_name = var.compute_name 
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
    compartment_id = oci_identity_compartment.container.id
    shape = var.instance_shape
    shape_config {
        memory_in_gbs = 16
        ocpus = 1
    }
    source_details {
        source_id = var.image_ocid
        source_type = "image"
        instance_source_image_filter_details {
            compartment_id = var.image_compartment
        }
    }
    create_vnic_details {
        assign_public_ip = true
        subnet_id = oci_core_subnet.publicsubnet.id
    }
}
data "oci_core_public_ip" "public_ip" {
    ip_address = oci_core_instance.compute_instance.public_ip
}