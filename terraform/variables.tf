variable "cloud_id" {
  description = "id of yandex cloud"
  type        = string
  default     = "b1g3jddf4nv5e9okle7p"
}

variable token { 
  description = "For security reasons, the token is defined in the shell script."
  type = string
  default = "" 
}
  
variable folder_id { 
  description = "id of the folder"
  type = string
  default = "b1gk067d0krcal09flv4"
}

variable zone { 
  description = "Network zone"
  type = string
  default = "ru-central1-a"
}

