terraform {
  required_providers {
    upcloud = {
      source  = "UpCloudLtd/upcloud"
      version = "~> 2.0"
    }
  }
}

provider "upcloud" {
  username = "jzan"
  password = "fajriz-fawbyv-xAqxi5"
}


resource "upcloud_network" "de-01" {
  name   = "de-01"
  zone   = "de-fra1"
  router = upcloud_router.de-01-router.id

  ip_network {
    address            = "10.255.192.0/22"
    dhcp               = true
    dhcp_default_route = true
    family             = "IPv4"
    gateway            = "10.255.192.1"
    dhcp_dns           = ["192.168.128.10", "8.8.8.8"]
  }
}

resource "upcloud_router" "de-01-router" {
  name = "de-01"
}

#resource "upcloud_gateway" "de-01-vpn" {
#  name     = "de-01-gw"
#  zone     = "de-fra1"
#  features = ["nat"]
#  router {
#    id = upcloud_router.de-01-router.id
#  }
#}

resource "upcloud_storage" "debian-1cpu-1gb-de-fra1_Device_1" {
  size = 10
  #tier  = "standard"
  title = "debian-1cpu-1gb-de-fra1 Device 1"
  zone  = "de-fra1"
}

resource "upcloud_server" "debian-1cpu-1gb-de-fra1" {
  firewall = false
  hostname = "debian-1cpu-1gb-de-fra1"
  metadata = true
  title    = "debian-1cpu-1gb-de-fra1"
  zone     = "de-fra1"
  plan     = "DEV-1xCPU-1GB-10GB"

  network_interface {
    ip_address_family = "IPv4"
    type              = "public"
  }

  network_interface {
    ip_address_family = "IPv4"
    type              = "utility"
  }

  network_interface {
    ip_address_family = "IPv6"
    type              = "public"
  }

  network_interface {
    ip_address_family = "IPv4"
    type              = "private"
    network           = upcloud_network.de-01.id
  }

  storage_devices {
    address = "virtio"
    storage = upcloud_storage.debian-1cpu-1gb-de-fra1_Device_1.id
    type    = "disk"
  }
}