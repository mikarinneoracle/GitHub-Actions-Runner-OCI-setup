data "oci_core_services" "runner_services" {
}

resource "oci_core_vcn" "runner_vcn" {
  compartment_id = var.compartment_ocid
  cidr_block     = "10.0.0.0/16"
  display_name   = "Runner VCN"
  dns_label      = "runner"
  freeform_tags = {
    Managed = var.tags
  }
}

resource "oci_core_internet_gateway" "runner_IG" {
  compartment_id = var.compartment_ocid
  display_name = "Runner Internet Gateway"
  enabled      = "true"
  freeform_tags = {
    Managed = var.tags
  }
  vcn_id = oci_core_vcn.runner_vcn.id
}

resource "oci_core_default_route_table" "runner_public_rt" {
  compartment_id = var.compartment_ocid
  display_name = "Runner Default Route Table"
  freeform_tags = {
    Managed = var.tags
  }
  manage_default_resource_id = oci_core_vcn.runner_vcn.default_route_table_id
  
  route_rules {
    description = "Internet Gateway"
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.runner_IG.id
  }
}

resource "oci_core_subnet" "runner_public_subnet" {
  vcn_id              = oci_core_vcn.runner_vcn.id
  cidr_block          = "10.0.0.0/24"
  compartment_id      = var.compartment_ocid
  display_name        = "Runner Public Subnet"
  freeform_tags       = {
    Managed = var.tags
  }
  prohibit_internet_ingress  = "false"
  prohibit_public_ip_on_vnic = "false"
  route_table_id             = oci_core_default_route_table.runner_public_rt.id
}