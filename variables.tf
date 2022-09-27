variable "App-server_name" {
    type = string
    default = "MAO-AppServer" 
}

variable "location" {
    type = string
    default = "southcentralus"
}

variable "resource_group_name" {
    type = string
    default = "BannerMigration-MAO-DEV"
}

variable "NIC_name" {
    type = string
    default = "MAO-NIC-App"
}

variable "app_server_count"{
    type = number
    default = 3
}

variable "subnet_id" {
    type = string
}
