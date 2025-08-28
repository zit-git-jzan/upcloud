# new server with only one interanl interface 

resource "upcloud_server" "windows-pki-ca1" {
  firewall = false
  hostname = "windows-pki-ca1"
  metadata = true
  title    = "windows-pki-ca1"
  zone     = "de-fra1"
  plan     = "DEV-2xCPU-16GB"

  network_interface {
    ip_address_family = "IPv4"
    type              = "private"
    network           = upcloud_network.de-01.id
  }

  template {
    storage = "Windows Server 2022 Standard"
    size    = 100
  }

  labels = {
    Environment = "Prod"
    Project     = "IaaS"
    System      = "Windows"
    Owner       = "JZAN"
  }

  user_data = <<-EOT
    #cloud-config
    chpasswd:
      list: |
        administrator:Vpn123!
      expire: False
  EOT

} 