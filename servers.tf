resource "upcloud_storage" "windows-2cpu-8gb-de-fra1_Device_1" {
  size  = 80
  tier  = "standard"
  title = "windows-2cpu-8gb-de-fra1 Device 1"
  zone  = "de-fra1"
}

resource "upcloud_storage" "windows-2cpu-16gb-de-fra1_Device_1" {
  size  = 100
  tier  = "standard"
  title = "windows-2cpu-16gb-de-fra1 Device 1"
  zone  = "de-fra1"
}

resource "upcloud_storage" "uag-debian-docker_Device_1" {
  size  = 60
  tier  = "standard"
  title = "uag-debian-docker Device 1"
  zone  = "de-fra1"
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
    network           = upcloud_network.de-01.id
  }

  storage_devices {
    address = "virtio"
    storage = upcloud_storage.windows-2cpu-8gb-de-fra1_Device_1.id
    type    = "disk"
  }
  labels = {
    Environment = "Prod"
    Project     = "IaaS"
    System      = "Linux"
    Owner       = "JZAN"
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
    network           = upcloud_network.de-01.id
  }

  storage_devices {
    address = "virtio"
    storage = upcloud_storage.windows-2cpu-16gb-de-fra1_Device_1.id
    type    = "disk"
  }
}

resource "upcloud_server" "uag-debian-docker" {
  firewall = false
  hostname = "uag-debian-docker"
  metadata = true
  title    = "uag-debian-docker"
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

  storage_devices {
    address = "virtio"
    storage = upcloud_storage.uag-debian-docker_Device_1.id
    type    = "disk"
  }
}
