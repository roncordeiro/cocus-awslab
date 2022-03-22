variable "environment" {
  description = "Environment of the module. E.g. Development, Testing, Staging, Production"
}
variable "project" {
  type = string
}
variable "service_name" {
    type = string
    description = "name of serviçe"
}
variable "save_to" {
    type = list(string)
    description = "Folders to save pem and pub files"
}