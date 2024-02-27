variable tenancy_ocid {
  type = string
  default = ""
  description = "the ocid of the tenancy where to deploy"
} 
variable user_ocid {
  type = string
  default = ""
  description = "The ocid of the user which will be used in OCI"
}
variable private_key_path {
  type = string
  default = ""
  description = "Path to API private key"
}
variable fingerprint {
  type = string
  default = ""
  description = "Fingerprint of API key"
}
variable region {
  type = string
  default = ""
  description = "Which region to deploy to"
}

variable source_compartment_ocid {
  type = string
  default = ""
  description = "In which compartment to start provision resources"
}

variable target_compartment{
  type = string
  default = ""
  description = "Name of new compartment"
}
variable target_compartment_description {
  type = string
  default = "POC"
  description = "Description of compartment"
}

