# Global variables
variable "location" {
  description = "Set a location for your new resource. If you do not fill in the default value will be used below."
  default     = "eastus2"
}

# Shared variables from your subscription
variable "network_rg_name" {
  description = "The shared resource group in your subscription used to allocate the virtual network, subnet, aks."
}

variable "shared_vnet_name" {
  description = "The name of the virtual network where you will create your new resource."
}

variable "shared_subnet_name" {
  description = "The name of the subnet where you will create your new resource."
}

# Your product variables
variable "product_rg_name" {
  description = "The resource group of your product where the new features will be created."
}

# Virtual network interface variables

variable "nic_name" {
  description = "Set a name for your nic. If you do not fill in the default value will be used below."
  default     = "nicapp"
}

variable "nic_ip_configuration_name" {
  description = "Set a name for your IC IP configuration. If you do not fill in the default value will be used below."
  default     = "nicipconfapp"
}

# Virtual machine variables
variable "vm_name" {
  description = "Set a name for your virtual machine. If you do not fill in the default value will be used below."
  default     = "personalvmapp"
}

variable "vm_size" {
  description = "Set a vm size for your virtual machine. If you do not fill in the default value will be used below."
  default     = "Standard_F1"
}


# Virtual machine storage variables
variable "vm_storage_os_disk_name" {
  description = "Set a name for your storage disk name. If you do not fill in the default value will be used below."
  default     = "stgosdsknameapp"
}

variable "vm_storage_os_disk_caching" {
  description = "Set a storage disk caching for your virtual machine. If you do not fill in the default value will be used below."
  default     = "ReadWrite"
}

variable "vm_storage_os_create_option" {
  description = "Set a storage create option for your virtual machine. If you do not fill in the default value will be used below."
  default     = "FromImage"
}

# variable "vm_storage_data_disk_size_gb" {
#   description = "Set a value for storage data disk size in GB. If you do not fill in the default value will be used below."
#   default     = "50"
# }

variable "vm_storage_os_managed_disk_type" {
  description = "Set a storage managed disk type for your virtual machine. If you do not fill in the default value will be used below."
  default     = "Standard_LRS"
}


# Virtual machine credential and profile variables
variable "vm_os_profile_computer_name" {
  description = "Set a hostname for your virtual machine. If you do not fill in the default value will be used below."
  default     = "personalcompapp"
}

variable "vm_os_profile_admin_username" {
  description = "Set a admin username for your virtual machine. Use environment variable to set this value."
}

variable "vm_os_profile_admin_password" {
  description = "Set a admin password for your admin username. Use environment variable to set this value."
}


# Virtual machine image variables
variable "vm_storage_image_reference_publisher" {
  description = "Set a storage image reference publisher for your virtual machine. If you do not fill in the default value will be used below."
  default     = "Canonical"
}

variable "vm_storage_image_reference_offer" {
  description = "Set a storage image reference offer for your virtual machine. If you do not fill in the default value will be used below."
  default     = "UbuntuServer"
}

variable "vm_storage_image_reference_sku" {
  description = "Set a storage image reference sku for your virtual machine. If you do not fill in the default value will be used below."
  default     = "18.04-LTS"
}

variable "vm_storage_image_reference_version" {
  description = "Set a storage image reference version for your virtual machine. If you do not fill in the default value will be used below."
  default     = "latest"
}
