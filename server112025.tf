resource "upcloud_server" "webserver-1" {
  firewall = false
  hostname = "webserver-1"
  metadata = true
  title    = "webserver-1"
  zone     = "de-fra1"
  plan     = "DEV-2xCPU-4GB"


  network_interface {
    ip_address_family = "IPv4"
    type              = "public"
  }

  network_interface {
    ip_address_family = "IPv4"
    type              = "private"
    network           = upcloud_network.de-01.id
  }



  template {
    storage = "Debian GNU/Linux 13 (Trixie)"
    size    = 60
    /*  backup_rule {
        interval  = "daily"
        time      = "0100"
        retention = 8
      } */
  }

  labels = {
    Environment = "Pord"
    Project     = "IaaS"
    System      = "Linux"
    Owner       = "JZAN"
  }


  login {
    create_password = false
    keys            = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIn37dO/2MG3ITtzYhMTVDsdNrQAa4rmGgtcR2XTnPWZ zandanelj@zandanelj-Device-iMac-with-OS-AppleOsX-1532.local"]
  }
}