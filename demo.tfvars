#This file contains values for the parameters

#OCI Configuration
tenancy_ocid                    = "ocid1.tenancy.oc1..aaaaaaaasb6hzdlysstqiacelk35wlgpjuottvsfkm6k7aa4ujrylb4shmra"
user_ocid                       = "ocid1.user.oc1..aaaaaaaanvbxe2k55c3adovddhpityuxpskvj3x77mrafmwwdhshekpamula"
private_key_path                = "~/.ssh/oraseemeaswedemo.pem"
fingerprint                     = "78:5f:84:8a:0d:38:f7:cb:4e:ce:ce:ea:bc:b4:e0:e9"
region                          = "eu-frankfurt-1"

#Structure settings
source_compartment_ocid          = "ocid1.compartment.oc1..aaaaaaaaff75tp2hk7vj4ixhlrf5ovqgzywpzjzfiiq2ssdvuwb2zhammbdq"
target_compartment              = "Training"
target_compartment_description  = "Resources in this compartment is provisioned by terraform only and used as a PoC"

#Network settings
vcn_name                        = "VGR"
vcn_dns                         = "VGR"
vcn_cidr                        = "10.0.0.0/24"
public_subnet_cidr              = "10.0.0.0/25"
public_subnet_dns               = "dmz"
public_subnet_name              = "Public"
private_subnet                  = false 
igw_name                        = "IGW"
routetable_name                 = "Public Route Table"
sl_name                         = "Public SL"


#Compute settings
compute_name                    = "webserver"
instance_shape                  = "VM.Standard.E4.Flex"
image_ocid                      = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaaxuo6wss32vwjxkyshsvjm2yrysep5axzhe4dpuozf32x5siistsq"
 
