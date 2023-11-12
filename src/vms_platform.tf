variable "vm_web_family" {
  type	      = string
  default     = "ubuntu-2004-lts"
  description = "ubuntu version"
}
	
#variable "vm_web_name" {
#  type	      = string
#  default     = "netology-develop-platform-web"
#  description = "instance name"
#}

variable "vm_web_platform_id" {
  type	      = string
  default     = "standard-v1"
  description = "platform ID"
}

#variable "vm_web_cores" {
#  type        = string
#  default     = "2"
#  description = "vCPU numbers"
#}

#variable "vm_web_memory" {
#  type        = string
#  default     = "1"
#  description = "VM memory, GB"
#}
	
#variable "vm_web_core_fraction" {
#  type        = string
#  default     = "5"
#  description = "core fraction"
#}

variable "vm_db_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "ubuntu version"
}

#variable "vm_db_name" {
#  type        = string
#  default     = "netology-develop-platform-db"
#  description = "instance name"
#}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "platform ID"
}

#variable "vm_db_cores" {
#  type        = string
#  default     = "2"
#  description = "vCPU numbers"
#}

#variable "vm_db_memory" {
#  type        = string
#  default     = "2"
#  description = "VM memory, GB"
#}

#variable "vm_db_core_fraction" {
#  type        = string
#  default     = "20"
#  description = "core fraction"
#}


variable "vms_resources" {
  description = "Resources for all vms"
  type        = map(map(number))
  default     = {
    vm_web_resources = {
      cores         = 2
      memory        = 1
      core_fraction = 5
    }
    vm_db_resources = {
      cores         = 2
      memory        = 2
      core_fraction = 20
    }
  }
}

variable "common_metadata" {
  description = "metadata for all vms"
  type        = map(string)
  default     = {
    serial-port-enable = "1"
    ssh-keys          = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEf7rM6MhOZMkc+lbzYCXNhOzqXldzlXYu2A14MQKMq/ root@netology"
  }
}
