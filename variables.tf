### Common variables used in all scripts
variable "name" {
  type = string
  default = "geekiam"
}
variable "region" {
  type = string
  default = "lon1"
}

variable "node_count" {
  type = number
  default = 1
}

# Grab the latest version slug from `doctl kubernetes options versions`
variable "k8s_version" {
  type = string
  default = "1.25.4-do.0"
}