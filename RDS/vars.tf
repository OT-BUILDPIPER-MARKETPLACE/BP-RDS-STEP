variable "database_subnet_ids" {
  description = "List of subnet IDs for the RDS database"
  type        = list(string)
  default     = [""]
}

variable "username" {
  description = "Username for the RDS database"
  type        = string
  default     = "admin"
}

variable "password" {
  description = "Password for the RDS database"
  type        = string
  default     = "Opstree#12345"
}

variable "engine_name" {
  description = "Name of the database engine"
  type        = string
  default     = "mysql"
}

variable "identifier" {
  description = "Identifier for the RDS instance"
  type        = string
  default     = "mysql-server"
}

variable "instance_class" {
  description = "Instance class for the RDS instance"
  type        = string
  default     = "db.t3.small"

}

variable "allocated_storage" {
  description = "Allocated storage for the RDS instance"
  type        = number
  default     = 20

}

variable "enable_whitelist_ip" {
  description = "Enable whitelisting of IP addresses in the security group"
  type        = bool
  default     = true
}

variable "enable_source_security_group_entry" {
  description = "Enable allowing traffic from the source security group in the security group"
  type        = bool
  default     = false
}

variable "rds_sg_name" {
  description = "Name of the RDS security group"
  type        = string
  default     = "rds_sq"
}

variable "vpc_id" {
  description = "ID of the VPC where the RDS security group will be created"
  type        = string
  default     = ""
}

variable "db_whitelist_cidr" {
  description = "CIDR block to whitelist for database access"
  type        = string
  default     = ""
}
