locals {
  database_subnet_ids = var.database_subnet_ids
  vpc_id              = var.vpc_id
  db_whitelist_cidr   = var.db_whitelist_cidr
}

module "mysql" {
  source = "OT-CLOUD-KIT/rds-mssql/aws"
  version                  = "0.0.2"
  database_subnet_ids      = local.database_subnet_ids
  username                 = var.username
  password                 = var.password
  engine_name              = var.engine_name
  identifier               = var.identifier
  instance_class           = var.instance_class
  allocated_storage        = var.allocated_storage
  database_security_groups = [module.rds_sg.sg_id]
  subnet_group_name        = var.subnet_group_name

  create_high_cpu_alarm                     = var.create_high_cpu_alarm
  env                                       = var.env
  db_instance_id                            = module.mysql.rds_instance_id
  evaluation_period                         = var.evaluation_period
  statistic_period                          = var.statistic_period
  cpu_utilization_too_high_threshold        = var.cpu_utilization_too_high_threshold
  create_low_disk_space_alarm               = var.create_low_disk_space_alarm
  disk_free_storage_space_too_low_threshold = var.disk_free_storage_space_too_low_threshold
  create_low_memory_alarm                   = var.create_low_memory_alarm
  memory_freeable_too_low_threshold         = var.memory_freeable_too_low_threshold
  create_anomaly_alarm                      = var.create_anomaly_alarm

}


module "rds_sg" {
  source                             = "OT-CLOUD-KIT/security-groups/aws"
  version                            = "1.0.0"
  enable_whitelist_ip                = var.enable_whitelist_ip
  enable_source_security_group_entry = var.enable_source_security_group_entry
  name_sg                            = var.rds_sg_name
  vpc_id                             = local.vpc_id
  ingress_rule = {
    rules = {
      rule_list = [
        {
          description  = "Rule for port 3306"
          from_port    = 3306
          to_port      = 3306
          protocol     = "tcp"
          cidr         = [local.db_whitelist_cidr]
          source_SG_ID = []
        }
      ]
    }
  }
}
