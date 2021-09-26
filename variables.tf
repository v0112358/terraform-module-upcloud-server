variable "zone" {
  type        = string
  description = "The zone in which the server will be created."
  default     = "sg-sin1"
}

variable "server_name" {
  type        = string
  description = "A valid domain name."
  default     = "upserver"
}

variable "server_size" {
  type        = string
  description = "The pricing plan used for the server."
  default     = "1xCPU-1GB"
}

variable "server_count" {
  type        = number
  description = "The number of server resource to create."
  default     = 1
}

variable "set_password" {
  type        = bool
  description = "Indicates a password should be create to allow access"
  default     = false
}

variable "image_id" {
  type        = string
  description = "The id of an image to use."
  default     = ""
}

variable "root_disk_size" {
  type        = number
  description = "The size of root disk in gigabytes."
  default     = "25"
}

variable "server_os" {
  type        = string
  description = "The template name to use."
  default     = "CentOS 8"
}

variable "metadata" {
  type        = bool
  description = "Is the metadata service active for the server."
  default     = false
}

variable "user_data" {
  type        = string
  description = "Defines URL for a server setup script, or the script body itself."
  default     = ""
}

variable "ssh_keys" {
  type        = list
  description = "A list of ssh keys to access the server."
  default     = []
}

variable "tags" {
  type        = list
  description = "A list of the tags to label this server."
  default     = []
}

variable "firewall" {
  type        = bool
  description = "Are firewall rules active for the server."
  default     = false
}

variable "floating_ip" {
  type        = bool
  description = "Boolean to control whether floating IPs should be created."
  default     = false
}

variable "floating_ip_count" {
  type        = number
  description = "The number of floating ip address to create."
  default     = 0
}

variable "public_networking" {
  type        = bool
  description = "Boolean to control whether public networking should be created."
  default     = true
}

variable "private_networking" {
  type        = bool
  description = "Boolean to control whether private networking should be created."
  default     = false
}

variable "private_subnet" {
  type        = string
  description = "The private subnet id should be assigned to server."
  default     = ""
}

variable "rolling_maintenance" {
  type = object({
    enable       = bool
    server_index = list(number)
    resize_plan  = string
  })
  description = "Server rolling maintenance"
  default = {
    enable       = false
    server_index = [0]
    resize_plan  = "1xCPU-2GB"
  }
}
