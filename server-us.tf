resource "upcloud_server" "test-us-1" {
  firewall = false
  hostname = "test-us-1"
  metadata = true
  title    = "test-us-1"
  zone     = "us-nyc1"
  plan     = "DEV-1xCPU-2GB"

  network_interface {
    ip_address_family = "IPv4"
    type              = "public"
  }

  network_interface {
    ip_address_family = "IPv4"
    type              = "private"
    network           = upcloud_network.us-01.id
  }

  template {
    storage = "Debian GNU/Linux 13 (Trixie)"
    size    = 40
    backup_rule {
      interval  = "daily"
      time      = "0100"
      retention = 8
    }
  }

  /* simple_backup {
    plan = "dailies"
    time = "0300"
  } */

  labels = {
    Environment = "Test"
    Project     = "IaaS"
    System      = "Linux"
    Owner       = "JZAN"
  }


  login {
    create_password = false
    keys            = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIn37dO/2MG3ITtzYhMTVDsdNrQAa4rmGgtcR2XTnPWZ zandanelj@zandanelj-Device-iMac-with-OS-AppleOsX-1532.local"]
    #user = "sysadmin"

    #password_delivery = "email"
  }
} 