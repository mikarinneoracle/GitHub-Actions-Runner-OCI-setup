data "oci_core_images" "sources" {
    compartment_id = var.compartment_ocid
}

data "template_file" "init" {
  template = "${file("${path.module}/init.tpl")}"
  vars = {
    filename = "${var.runner_file}",
    token = "${var.runner_token}",
    url = "${var.runner_url}",
    runnergroup = "${var.runner_runnergroup}"
  }
}