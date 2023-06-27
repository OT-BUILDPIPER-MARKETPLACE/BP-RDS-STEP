module "mysql" {
  source  = "OT-CLOUD-KIT/rds-mssql/aws"
  version = "0.0.1" 
  database_subnet_ids      = [data.terraform_remote_state.remote.outputs.db-subnet-ids[0], data.terraform_remote_state.remote.outputs.db-subnet-ids[1]]
  username                 = var.username
  password                 = var.password
  engine_name              = var.engine_name
  identifier               = var.identifier
  instance_class           = var.instance_class
  allocated_storage        = var.allocated_storage

database_security_groups = [module.rds_sg.sg_id]


}

module "rds_sg" {
  source                             = "OT-CLOUD-KIT/security-groups/aws"
  version                            = "1.0.0"
  enable_whitelist_ip                = true
  enable_source_security_group_entry = false
  name_sg                            = "var.sg_name"
  vpc_id                             = data.terraform_remote_state.remote.outputs.vpc_id
  ingress_rule = {
    rules = {
      rule_list = [
        {
          description  = "Rule for port 3306"
          from_port    = 3306
          to_port      = 3306
          protocol     = "tcp"
          cidr         = ["var.db_whitelist_cidr"]
          source_SG_ID = []
        }
      ]
    }
  }
}
