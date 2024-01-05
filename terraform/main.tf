module "tf-yc-instance" {
  source = "./modules/tf-yc-instance/"
  yandex_vpc_subnet = module.tf-yc-network.yandex_vpc_subnet
  zone = var.zone
}

module "tf-yc-network" {
  source = "./modules/tf-yc-network/"
}


