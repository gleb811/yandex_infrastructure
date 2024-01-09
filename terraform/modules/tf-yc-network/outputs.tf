output "yandex_vpc_subnet" {
    value = data.yandex_vpc_subnet.default
}

output "yandex_vpc_network" {
    value = data.yandex_vpc_network.default
}


output "avaliable_zones" {
    value = var.network_zones
}
