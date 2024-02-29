#This file contains values for the parameters

#OCI Configuration
tenancy_ocid                    = "ocid1.tenancy.oc19..aaaaaaaaikt5cwahulhxv7noan5252albzixgw5ingi335vneqsyzgsvxaga"
user_ocid                       = "ocid1.user.oc19..aaaaaaaa6btwvr6fr66mmec4l6ov55hngty7dzhp7zmcoxbgnr7cqxghjgda"
private_key_path                = "~/.ssh/oraseemeaswedemo.pem"
fingerprint                     = "78:5f:84:8a:0d:38:f7:cb:4e:ce:ce:ea:bc:b4:e0:e9"
region                          = "eu-frankfurt-2"

#Structure settings
source_compartment_ocid          = "ocid1.tenancy.oc19..aaaaaaaaikt5cwahulhxv7noan5252albzixgw5ingi335vneqsyzgsvxaga"
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
image_ocid                      = "ocid1.image.oc19.eu-frankfurt-2.aaaaaaaayhvdpyuelfyiyc4sl3yiau3xfuetydqyxhwolp5spdftr6egzbvq"
image_compartment_ocid          = "ocid1.compartment.oc19..aaaaaaaa7ra46a2zba2dfqpjfle73z2qmmarumqsu7uvvlvyd46jn5r7pcsq"
