# new server with only one interanl interface 

resource "upcloud_server" "DEFRAAPP02" {
  hostname = "defraapp02.zandanel.intern"
  firewall = false
  metadata = true
  title    = "defraapp02"
  zone     = "de-fra1"
  plan     = "DEV-2xCPU-8GB"

  network_interface {
    ip_address_family = "IPv4"
    ip_address        = "10.255.192.3"
    type              = "private"
    network           = upcloud_network.de-01.id
  }

  template {
    storage = "Windows Server 2025 Standard"
    size    = 80
  }

  labels = {
    Environment = "Prod"
    Project     = "IaaS"
    System      = "Windows"
    Owner       = "JZAN"
  }
}

resource "upcloud_server" "DEFRADC02" {
  hostname = "defradc02.zandanel.intern"
  firewall = false
  metadata = true
  title    = "defradc02"
  zone     = "de-fra1"
  plan     = "DEV-2xCPU-8GB"

  network_interface {
    ip_address_family = "IPv4"
    ip_address        = "10.255.192.5"
    type              = "private"
    network           = upcloud_network.de-01.id
  }

  template {
    storage = "Windows Server 2025 Standard"
    size    = 80
  }

  simple_backup {
    plan = "dailies"
    time = "0300"
  }

  labels = {
    Environment = "Prod"
    Project     = "IaaS"
    System      = "Windows"
    Owner       = "JZAN"
  }
} 