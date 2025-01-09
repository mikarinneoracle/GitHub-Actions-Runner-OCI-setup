variable "region" {
  description = "Your region"
}

variable "compartment_ocid" {
  description = "Compartment for runner"
}

variable "runner_vm_name" {
  default = "GitHub Actions runner"
  description = "Runner and VM name (Runner and VM name will be equal)"
}

variable "vm_image_name" {
  default = "Oracle-Linux-Cloud-Developer-8.9-2024.02.29-0"
  description = "Runner image"
}

variable "vm_shape" {
  default = "VM.Standard.E4.Flex"
  description = "Runner shape"
}

variable "vm_shape_ocpus" {
  default = "1"
  description = "Runner OCPUs"
}

variable "vm_shape_mem" {
  default = "8"
  description = "Runner memory (GB)"
}

variable "vm_shape_disk" {
  default = "200"
  description = "Runner boot volume disk size (GB)"
}

variable "runner_file" {
  description = "GitHub Actions Runner tar file"
  default = "https://github.com/actions/runner/releases/download/v2.321.0/actions-runner-linux-x64-2.321.0.tar.gz"
}

variable "runner_url" {
  description = "GitHub Actions url for runner"
}

variable "runner_token" {
  description = "Token for Runner creation. You must copy this from GitHub Actions create self hosted runner -page since it is short lived."
}

variable "runner_runnergroup" {
  default = "Default"
  description = "GitHub Actions runner group"
}

variable "tags" {
  default = "Created for GitHub Actions runner"
}
