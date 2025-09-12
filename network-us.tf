resource "upcloud_network" "us-01" {
  name   = "us-02"
  zone   = "us-nyc1"
  router = upcloud_router.us-01.id

  ip_network {
    address            = "10.255.197.0/24"
    dhcp               = true
    dhcp_default_route = true
    dhcp_dns           = ["10.255.192.4", "8.8.8.8"]
    family             = "IPv4"
    gateway            = "10.255.197.1"
  }
  labels = {
    Environment = "TEST"
    Project     = "IaaS"
    System      = "VPC"
    Owner       = "JZAN"
  }
}

resource "upcloud_router" "us-01" {
  name = "us-01"
  labels = {
    Environment = "Test"
    Project     = "IaaS"
    System      = "Router"
    Owner       = "JZAN"
  }
}