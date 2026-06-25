module "vpc" {
  source = "../modules/vpc"
}

module "aurora" {
  source = "../modules/aurora"
  vpc_id = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
  ecs_sg = module.ecs.ecs_sg
}

module "ecs" {
  source = "../modules/ecs"
  vpc_id = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
  private_subnets = module.vpc.private_subnets
  db_endpoint = module.aurora.endpoint
  image = "${var.image}"
}

variable "image" {
  default = "your-dockerhub-username/poc18-app"
}
