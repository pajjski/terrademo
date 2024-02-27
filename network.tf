variable vcn_cidr {
    type        = string
    default     = "192.168.0.0/24"
    description = "CIDR-block for the whole VCN"
}
variable vcn_name {
    type        = string
    default     = "vgrcloud"
    description = "This is the display name of the VCN"
}
variable vcn_dns {
    type        = string
    default     = "vgrcloud"
    description = "This is the internal DNS name, oraclevcn.com will be appended at end"
}
variable public_subnet_cidr {
    type        = string
    default     = "192.168.0.0/25"
    description = "CIDR-block of subnet"
}
variable public_subnet_dns {
    type = string
    default = "dmz"
    description = "Internal DNS-suffic for subnet"
}
variable private_subnet {
    type        = bool
    default     = false 
    description = "Public subnet or not"
}
variable public_subnet_name {
    type = string
    default = "PubSub"
    description = "Display name for Subnet"
}
variable igw_name {
    type = string
    default = "IGW"
    description = "Display name of the Internet Gateway"
}
variable routetable_name {
    type = string
    default = "Public Route table"
    description = "Route table used by public subnets"
}
variable sl_name {
    type = string
    default = "Public Security List"
    description = "Security List used by public subnets"
}
resource "oci_core_vcn" "network" {
  cidr_block     = var.vcn_cidr 
  dns_label      = var.vcn_dns
  compartment_id = oci_identity_compartment.container.id 
  display_name   = var.vcn_name 
}
resource "oci_core_subnet" "publicsubnet" {
  cidr_block        = var.public_subnet_cidr 
  display_name      = var.public_subnet_name 
  dns_label         = var.public_subnet_dns
  prohibit_public_ip_on_vnic = var.private_subnet 
  compartment_id    = oci_identity_compartment.container.id 
  vcn_id            = oci_core_vcn.network.id 
  route_table_id    = oci_core_route_table.route_table.id
  security_list_ids = [oci_core_security_list.security_list.id]
}
resource "oci_core_internet_gateway" "internet_gateway" {
    compartment_id = oci_identity_compartment.container.id 
    vcn_id = oci_core_vcn.network.id
    display_name = var.igw_name
}
resource "oci_core_route_table" "route_table" {
    #Required
    compartment_id = oci_identity_compartment.container.id
    vcn_id = oci_core_vcn.network.id
    display_name = var.routetable_name
    route_rules {
        #Required
        network_entity_id = oci_core_internet_gateway.internet_gateway.id
        destination = "0.0.0.0/0"
    }
}
resource "oci_core_security_list" "security_list" {
    compartment_id = oci_identity_compartment.container.id 
    vcn_id = oci_core_vcn.network.id
    display_name = var.sl_name
    egress_security_rules {
        protocol = "6"
        destination = "0.0.0.0/0"
    }
    ingress_security_rules {
      protocol = "6"
      source = "0.0.0.0/0"
      tcp_options {
        min = 80
        max = 80
      } 
    }
}