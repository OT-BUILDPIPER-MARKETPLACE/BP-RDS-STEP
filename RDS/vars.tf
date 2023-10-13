variable "region" {
  type        = string
  description = "Region where resource will be created."
}

variable "database_subnet_ids" {
  description = "List of subnet IDs for the RDS database"
  type        = list(string)
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
}

variable "db_whitelist_cidr" {
  description = "CIDR block to whitelist for database access"
  type        = string
  default     = ""
}
variable "subnet_group_name" {
  description = "subnet group name"
  type        = string
  default     = "db_sn_1"
}

#RDS-cloudwatchalarm

variable "create_high_cpu_alarm" {
  type        = bool
  default     = true
  description = "Whether or not to create the high cpu alarm.  Default is to create it (for backwards compatible support)"
}

variable "prefix" {
  type        = string
  default     = ""
  description = "Alarm Name Prefix"
}

# variable "db_instance_id" {
#   type        = string
#   description = "RDS Instance ID"
# }

variable "evaluation_period" {
  type        = string
  default     = "5"
  description = "The evaluation period over which to use when triggering alarms."
}


variable "statistic_period" {
  type        = string
  default     = "60"
  description = "The number of seconds that make each statistic period."
}

variable "cpu_utilization_too_high_threshold" {
  type        = string
  default     = "90"
  description = "Alarm threshold for the 'highCPUUtilization' alarm"
}

variable "actions_alarm" {
  type        = list(any)
  default     = []
  description = "A list of actions to take when alarms are triggered. Will likely be an SNS topic for event distribution."
}

variable "actions_ok" {
  type        = list(any)
  default     = []
  description = "A list of actions to take when alarms are cleared. Will likely be an SNS topic for event distribution."
}

variable "rds-tags" {
  type        = map(string)
  default     = {}
  description = "Tags to attach to each alarm"
}


variable "disk_free_storage_space_too_low_threshold" {
  type        = string
  default     = "10000000000" // 10 GB
  description = "Alarm threshold for the 'lowFreeStorageSpace' alarm"
}

variable "memory_freeable_too_low_threshold" {
  type        = string
  default     = "256000000" // 256 MB
  description = "Alarm threshold for the 'lowFreeableMemory' alarm"
}

variable "anomaly_period" {
  type        = string
  default     = "600"
  description = "The number of seconds that make each evaluation period for anomaly detection."
}

variable "anomaly_band_width" {
  type        = string
  default     = "2"
  description = "The width of the anomaly band, default 2.  Higher numbers means less sensitive."
}

variable "create_anomaly_alarm" {
  type        = bool
  default     = true
  description = "Whether or not to create the fairly noisy anomaly alarm.  Default is to create it (for backwards compatible support), but recommended to disable this for non-production databases"
}

variable "create_low_memory_alarm" {
  type        = bool
  default     = true
  description = "Whether or not to create the low memory free alarm.  Default is to create it (for backwards compatible support)"
}

variable "create_low_disk_space_alarm" {
  type        = bool
  default     = true
  description = "Whether or not to create the low disk space alarm.  Default is to create it (for backwards compatible support)"
}