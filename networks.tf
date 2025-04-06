# Zone de-fra1

resource "upcloud_network" "de-01" {
  name   = "de-01"
  zone   = "de-fra1"
  router = upcloud_router.de-01-router.id
  labels = {
    env = "Prod"
    dep = "Terraform"
  }

  ip_network {
    address            = "10.255.192.0/22"
    dhcp               = true
    dhcp_default_route = true
    family             = "IPv4"
    gateway            = "10.255.192.1"
    dhcp_dns           = ["192.168.128.10", "10.255.192.4", "8.8.8.8"]
  }
}

resource "upcloud_network" "de-02" {
  name   = "de-02"
  zone   = "de-fra1"
  router = upcloud_router.de-01-router.id
  labels = {
    env = "Prod"
    dep = "Terraform"
  }

  ip_network {
    address            = "10.255.190.0/24"
    dhcp               = true
    dhcp_default_route = true
    family             = "IPv4"
    gateway            = "10.255.190.1"
    dhcp_dns           = ["10.255.192.4", "8.8.8.8"]
  }
}
resource "upcloud_router" "de-01-router" {
  name = "de-01"
  labels = {
    env = "Prod"
    dep = "Terraform"
  }
}

resource "upcloud_network" "de-03" {
  name   = "de-03"
  zone   = "de-fra1"
  router = upcloud_router.de-01-router.id
  labels = {
    env = "Prod"
    dep = "Terraform"
  }

  ip_network {
    address            = "10.255.191.0/24"
    dhcp               = true
    dhcp_default_route = false
    family             = "IPv4"
    gateway            = "10.255.191.1"
    dhcp_dns           = ["10.255.192.4", "8.8.8.8"]
  }
}



