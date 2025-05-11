
resource "upcloud_storage" "windows-2cpu-16gb-de-fra1_Device_1" {
  size  = 100
  tier  = "standard"
  title = "windows-2cpu-16gb-de-fra1 Device 1"
  zone  = "de-fra1"
}

resource "upcloud_storage" "windows-2cpu-8gb-de-fra1_Device_1" {
  size  = 80
  tier  = "standard"
  title = "windows-2cpu-8gb-de-fra1 Device 1"
  zone  = "de-fra1"
}

resource "upcloud_network" "de-01_2" {
  name   = "de-01"
  zone   = "de-fra1"
  router = upcloud_router.de-01.id

  ip_network {
    address            = "10.255.192.0/22"
    dhcp               = true
    dhcp_default_route = true
    dhcp_dns           = ["10.255.192.4", "192.168.128.10", "8.8.8.8"]
    family             = "IPv4"
    gateway            = "10.255.192.1"
  }
}

resource "upcloud_server" "windows-2cpu-16gb-de-fra1" {
  firewall = false
  hostname = "windows-2cpu-16gb-de-fra1"
  metadata = false
  title    = "windows-2cpu-16gb-de-fra1"
  zone     = "de-fra1"
  plan     = "DEV-2xCPU-16GB"

  network_interface {
    ip_address_family = "IPv4"
    type              = "private"
    network           = upcloud_network.de-01_2.id
  }

  storage_devices {
    address = "virtio"
    storage = upcloud_storage.windows-2cpu-16gb-de-fra1_Device_1.id
    type    = "disk"
  }
}

resource "upcloud_server" "windows-2cpu-8gb-de-fra1" {
  firewall = false
  hostname = "windows-2cpu-8gb-de-fra1"
  metadata = false
  title    = "windows-2cpu-8gb-de-fra1"
  zone     = "de-fra1"
  plan     = "DEV-2xCPU-8GB"

  network_interface {
    ip_address_family = "IPv4"
    type              = "private"
    network           = upcloud_network.de-01_2.id
  }

  storage_devices {
    address = "virtio"
    storage = upcloud_storage.windows-2cpu-8gb-de-fra1_Device_1.id
    type    = "disk"
  }
}

resource "upcloud_router" "de-01" {
  name = "de-01"
}