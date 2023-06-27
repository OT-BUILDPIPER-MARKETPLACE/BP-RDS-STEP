variable "engine_name" {
  description = "name of db engine"
  type        = string
  default     = "mysql"
}

variable "sg_name" {
  description = "name of db engine"
  type        = string
  default     = "rds_sg"
}

variable "db_whitelist_cidr" {
default = ["10.0.0.0/18"]
}

variable "identifier" {
  description = "name of db identifier"
  type        = string
  default     = "mysql-server"
}

variable "db_name" {
  description = "Enter the name of the database to be created inside DB Instance"
  type        = string
  default     = null
}
variable "username" {
  description = "username"
  type        = string
  default     = "admin"
}

variable "password" {
  description = "Enter the password"
  type        = string
  default     = "Opstree#12345"
}


variable "instance_class" {
  description = "type of instance"
  type        = string
  default     = "db.t3.small"
}


variable "allocated_storage" {
  description = "storage size"
  type        = number
  default     = 20
}


variable "database_subnet_ids" {
  description = "ids of database subnets"
  type        = list(string)
  default     = null
}

variable "database_security_groups" {
  description = "security group of database"
  type        = list(any)
  default     = []
}

