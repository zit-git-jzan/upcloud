resource "upcloud_server" "DEFRAtest01" {
  hostname = "defratest01.zandanel.intern"
  firewall = false
  metadata = true
  title    = "defratest01"
  zone     = "de-fra1"
  plan     = "DEV-2xCPU-8GB"

  network_interface {
    ip_address_family = "IPv4"
    #ip_address        = "10.255.192.6"
    type    = "private"
    network = upcloud_network.de-01.id
  }

  template {
    storage = "Windows Server 2025 Standard"
    size    = 80
  }

  labels = {
    Environment = "Test"
    Project     = "IaaS"
    System      = "Windows"
    Owner       = "JZAN"
  }
}