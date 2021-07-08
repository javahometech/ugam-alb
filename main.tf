module "networking" {
  source = "./modules/networking"
}

locals {
  targets = {
      "orders" : aws_instance.web.id
      "payments": aws_instance.web2.id
  }
  target_group_arns = [for k, v in module.payments-target :  v.target_group_arns]
}

module "payments-target" {
  for_each = local.targets
  source = "./modules/alb-target-group"
  vpc_id = module.networking.vpc_id
  app_name = each.key
  target_id = each.value
}

module "alb" {
  source = "./modules/alb"
  vpc_id = module.networking.vpc_id
  subnet_ids = module.networking.pub_sub_ids
  default_tg_arn = local.target_group_arns[0]
  listner_rules = {
    "orders" = {
      path_pattern = [ "/payments/*" ]
      priority = 1
      target_group_arn = "value"
    }
  }
}
