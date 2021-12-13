variable "client" {
    description = "Client of TCS for which the resources are created"
    type = string  
}

variable "environment" {
    description = "the environment for which the resources are created"
    type = string
}

variable "resourcegroupname" {
    description = "Contains the resource group name"
    type = string
}

variable "resourcegrouplocation" {
    description = "Contains the resource group location" 
    type = string
}

variable "vnetname" {
    description = "Contains the vnet name suffix"
    type = string
}

variable "vnetaddress" {
    description = "Contains the vnet address range "
    type = list(string)
}



variable "bastionsubnetname" {
    description = "Contains the dbsubnet name suffix"
    type = string
}

variable "bastionsubnetaddress" {
    description = "Contains the dbsubnet address range "
    type = list(string)
}

# Input variables for bastion vm

variable "bastionvm_hostname" {
    description = "Contains the hostname suffix of linux vm"
    type = string
}

variable "bastionvm_size" {
    description = "Contains the size of the linux vm"
    type = string  
}

variable "bastionvm_user" {
    description = "Contains the admin username"
    type = string  
}

variable "bastionvm_password" {
    description = "Contains the admin user password"
    type = string 
}

variable "bastionvm_vnicname" {
    description = "Contains the suffix of the vnic name"
    type = string  
}

variable "bastionvm_privateip" {
    description = "Contains the static private ip"
    type = string
}

variable "bastionvm_pubipname" {
    description = "Contains the bastionvm pubip suffix"
    type = string  
}

# End of input variables for bastion vm

# Input variables for mysqldb PAAS #

variable "dbcount_per_server" {
    description = "Contains the number of sql db servers that are required to be built"
    type = number
    }

variable "mysqldb_server_name" {
    description = "contains the user defined middle name of servers"
    type = string
    }

variable "mysqldb_schema_name" {
    description = "contains the user defined middle name of instance"
    type = string
    }

variable "mysql_db_username" {
  description = "Azure MySQL Database Administrator Username"
  type        = string
}

variable "mysql_db_password" {
  description = "Azure MySQL Database Administrator Password"
  type        = string
  sensitive   = true
}

# End of mysqldb PaaS variables




