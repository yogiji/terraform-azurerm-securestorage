variable "resource_group_name" {
  type        = string
  description = "Resource Group Name"
}
variable "environment" {
  type        = string
  description = "Production or Development"
}
variable "location" {
  type        = string
  description = "resrouce location"
}
variable "name" {
  type        = string
  description = "storage account name"
}