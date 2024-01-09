variable disk_size { 
  description = "Disk size in Gb"
  type = number
  default = 6
}

variable CPUs_in_use { 
  description = "Define CPU resources"
  type = string
  default = "standard-v1"
}

variable VM_name { 
  description = "Name of Virtual Machine to be created"
  type = string
  default = "chapter5-lesson2-std-024-07"
}

variable core_number { 
  description = "Number od CPU cores"
  type = number
  default = 2
}

variable RAM_size { 
  description = "RAM size in Gb"
  type = number
  default = 2
}
variable preemptible_VM { 
  description = "Create a preemptible VM"
  type = bool
  default = true
} 

variable os_family { 
  description = "Defines Os family"
  type = string
  default = "ubuntu-2004-lts"
}


# This variable is taken from "tf-yc-network" module
variable "yandex_vpc_subnet"{
}

# This variable is taken from the main module
variable "zone"{
}

