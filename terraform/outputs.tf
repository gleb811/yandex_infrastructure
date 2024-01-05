output "ip_address_pub" {
    value = "${module.tf-yc-instance.ip_address_pub}"
}

output "ip_address_local" {
  value = "${module.tf-yc-instance.ip_address}"
}

/*
output "yandex_vpc_subnet" {
  value = "${module.tf-yc-network.yandex_vpc_subnet}"
}


output "yandex_vpc_network" {
  value = "${module.tf-yc-network.yandex_vpc_network}"
}

output "avaliable_zones" {
  value = "${module.tf-yc-network.avaliable_zones}"
}
*/
