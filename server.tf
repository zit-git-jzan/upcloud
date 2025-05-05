


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

#resource "upcloud_storage" "centos-1cpu-2gb-de-fra1_Device_1" {
#  size  = 30
#  tier  = "standard"
#  title = "centos-1cpu-2gb-de-fra1 Device 1"
#  zone  = "de-fra1"
#}

resource "upcloud_storage" "debian-1cpu-2gb-de-fra1_Device_1" {
  size  = 30
  tier  = "standard"
  title = "debian-1cpu-2gb-de-fra1 Device 1"
  zone  = "de-fra1"
}

resource "upcloud_storage" "fw-mgmt-disk0" {
  size  = 100
  tier  = "standard"
  title = "fw-mgmt-disk0"
  zone  = "de-fra1"
}


resource "upcloud_server" "windows-2cpu-8gb-de-fra1" {
  firewall = false
  hostname = "windows-2cpu-8gb-de-fra1"
  # metadata = false
  title = "windows-2cpu-8gb-de-fra1"
  zone  = "de-fra1"
  plan  = "DEV-2xCPU-8GB"
  labels = {
    "dep" = "Terraform"
    "env" = "Prod"
  }

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
}

resource "upcloud_server" "windows-2cpu-16gb-de-fra1" {
  firewall = false
  hostname = "windows-2cpu-16gb-de-fra1"
  # metadata = false
  title = "windows-2cpu-16gb-de-fra1"
  zone  = "de-fra1"
  plan  = "DEV-2xCPU-16GB"
  labels = {
    "dep" = "Terraform"
    "env" = "Prod"
  }

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

#resource "upcloud_server" "centos-1cpu-2gb-de-fra1" {
#  firewall = true
# hostname = "centos-1cpu-2gb-de-fra1"
#  # metadata = false
#  title = "centos-1cpu-2gb-de-fra1"
#  zone  = "de-fra1"
#  plan  = "DEV-1xCPU-2GB"
#  labels = {
#    "dep" = "Terraform"
#    "env" = "Prod"
#  }


#  network_interface {
#    ip_address_family = "IPv4"
#    type              = "public"
#  }

#  network_interface {
#    ip_address_family = "IPv4"
#    type              = "private"
#    network           = upcloud_network.de-01_2.id
#  }

#  storage_devices {
#    address = "virtio"
#    storage = upcloud_storage.centos-1cpu-2gb-de-fra1_Device_1.id
#    type    = "disk"
#  }
#}

resource "upcloud_server" "debian-1cpu-2gb-de-fra1" {
  firewall = true
  hostname = "debian-1cpu-2gb-de-fra1"
  # metadata = true
  title = "debian-1cpu-2gb-de-fra1"
  zone  = "de-fra1"
  plan  = "DEV-1xCPU-2GB"
  labels = {
    "dep" = "Terraform"
    "env" = "Prod"
  }

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
    storage = upcloud_storage.debian-1cpu-2gb-de-fra1_Device_1.id
    type    = "disk"
  }
}

resource "upcloud_server" "fw-mgmt" {
  firewall = true
  hostname = "fw-mgmt"
  # metadata = false
  title = "fw-mgmt"
  zone  = "de-fra1"
  plan  = "DEV-2xCPU-16GB"
  labels = {
    "dep" = "Terraform"
    "env" = "Prod"
  }

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
    storage = upcloud_storage.fw-mgmt-disk0.id
    type    = "disk"
  }
}

#resource "upcloud_firewall_rules" "centos-1cpu-2gb-de-fra1-firewall" {
#  server_id = upcloud_server.centos-1cpu-2gb-de-fra1.id
#
#  firewall_rule {
#    action               = "accept"
#    direction            = "in"
#    family               = "IPv6"
#    protocol             = "tcp"
#    source_address_end   = "2a04:3540:53::1"
#    source_address_start = "2a04:3540:53::1"
#    source_port_end      = "53"
#    source_port_start    = "53"
#  }
#
#  firewall_rule {
#    action               = "accept"
#    direction            = "in"
#    family               = "IPv6"
#    protocol             = "udp"
#    source_address_end   = "2a04:3540:53::1"
#    source_address_start = "2a04:3540:53::1"
#    source_port_end      = "53"
#    source_port_start    = "53"
#  }
#
#  firewall_rule {
#    action               = "accept"
#    direction            = "in"
#    family               = "IPv6"
#    protocol             = "tcp"
#    source_address_end   = "2a04:3544:53::1"
#    source_address_start = "2a04:3544:53::1"
#    source_port_end      = "53"
#    source_port_start    = "53"
#  }

# firewall_rule {
#    action               = "accept"
#    direction            = "in"
#    family               = "IPv6"
#    protocol             = "udp"
#    source_address_end   = "2a04:3544:53::1"
#    source_address_start = "2a04:3544:53::1"
#    source_port_end      = "53"
#    source_port_start    = "53"
#  }

#  firewall_rule {
#    action               = "accept"
#    direction            = "in"
#    family               = "IPv4"
#    protocol             = "udp"
#    source_address_end   = "94.237.127.9"
#    source_address_start = "94.237.127.9"
#    source_port_end      = "53"
#    source_port_start    = "53"
#  }

#  firewall_rule {
#    action               = "accept"
#    direction            = "in"
#   family               = "IPv4"
#    protocol             = "tcp"
#    source_address_end   = "94.237.127.9"
#    source_address_start = "94.237.127.9"
#    source_port_end      = "53"
#    source_port_start    = "53"
#  }
#
#  firewall_rule {
#    action               = "accept"
#    direction            = "in"
#    family               = "IPv4"
#    protocol             = "udp"
#    source_address_end   = "94.237.40.9"
#    source_address_start = "94.237.40.9"
#    source_port_end      = "53"
#    source_port_start    = "53"
#  }
#
#  firewall_rule {
#    action               = "accept"
#    direction            = "in"
#    family               = "IPv4"
#    protocol             = "tcp"
#    source_address_end   = "94.237.40.9"
#    source_address_start = "94.237.40.9"
#    source_port_end      = "53"
#    source_port_start    = "53"
#  }
#
#  firewall_rule {
#    action               = "accept"
#    comment              = "Internal allowed"
#    direction            = "in"
#    family               = "IPv4"
#    source_address_end   = "192.168.255.255"
#    source_address_start = "192.168.0.0"
#  }
#
#  firewall_rule {
#    action               = "accept"
#    comment              = "Internal communiocation allowed"
#    direction            = "in"
#    family               = "IPv4"
#    source_address_end   = "10.255.255.255"
#    source_address_start = "10.0.0.0"
#  }
#
#  firewall_rule {
#    action                 = "accept"
#    destination_port_end   = "80"
#    destination_port_start = "80"
#    direction              = "in"
#    family                 = "IPv4"
#    protocol               = "tcp"
#  }
#
#  firewall_rule {
#    action    = "drop"
#    comment   = "Cleanup Rule"
#    direction = "in"
#    family    = "IPv4"
#  }
#}

resource "upcloud_firewall_rules" "debian-1cpu-2gb-de-fra1-firewall" {
  server_id = upcloud_server.debian-1cpu-2gb-de-fra1.id

  firewall_rule {
    action               = "accept"
    direction            = "in"
    family               = "IPv6"
    protocol             = "tcp"
    source_address_end   = "2a04:3540:53::1"
    source_address_start = "2a04:3540:53::1"
    source_port_end      = "53"
    source_port_start    = "53"
  }

  firewall_rule {
    action               = "accept"
    direction            = "in"
    family               = "IPv6"
    protocol             = "udp"
    source_address_end   = "2a04:3540:53::1"
    source_address_start = "2a04:3540:53::1"
    source_port_end      = "53"
    source_port_start    = "53"
  }

  firewall_rule {
    action               = "accept"
    direction            = "in"
    family               = "IPv6"
    protocol             = "tcp"
    source_address_end   = "2a04:3544:53::1"
    source_address_start = "2a04:3544:53::1"
    source_port_end      = "53"
    source_port_start    = "53"
  }

  firewall_rule {
    action               = "accept"
    direction            = "in"
    family               = "IPv6"
    protocol             = "udp"
    source_address_end   = "2a04:3544:53::1"
    source_address_start = "2a04:3544:53::1"
    source_port_end      = "53"
    source_port_start    = "53"
  }

  firewall_rule {
    action               = "accept"
    direction            = "in"
    family               = "IPv4"
    protocol             = "udp"
    source_address_end   = "94.237.127.9"
    source_address_start = "94.237.127.9"
    source_port_end      = "53"
    source_port_start    = "53"
  }

  firewall_rule {
    action               = "accept"
    direction            = "in"
    family               = "IPv4"
    protocol             = "tcp"
    source_address_end   = "94.237.127.9"
    source_address_start = "94.237.127.9"
    source_port_end      = "53"
    source_port_start    = "53"
  }

  firewall_rule {
    action               = "accept"
    direction            = "in"
    family               = "IPv4"
    protocol             = "udp"
    source_address_end   = "94.237.40.9"
    source_address_start = "94.237.40.9"
    source_port_end      = "53"
    source_port_start    = "53"
  }

  firewall_rule {
    action               = "accept"
    direction            = "in"
    family               = "IPv4"
    protocol             = "tcp"
    source_address_end   = "94.237.40.9"
    source_address_start = "94.237.40.9"
    source_port_end      = "53"
    source_port_start    = "53"
  }

  firewall_rule {
    action               = "accept"
    direction            = "in"
    family               = "IPv4"
    source_address_end   = "136.144.103.52"
    source_address_start = "136.144.103.52"
  }

  firewall_rule {
    action                 = "accept"
    comment                = "HTTP In"
    destination_port_end   = "80"
    destination_port_start = "80"
    direction              = "in"
    family                 = "IPv4"
    protocol               = "tcp"
  }

  firewall_rule {
    action               = "accept"
    comment              = "RFC 1918 2"
    direction            = "in"
    family               = "IPv4"
    source_address_end   = "102.168.255.255"
    source_address_start = "102.168.0.0"
  }

  firewall_rule {
    action               = "accept"
    comment              = "RFC1918 1"
    direction            = "in"
    family               = "IPv4"
    source_address_end   = "10.255.255.255"
    source_address_start = "10.0.0.0"
  }

  firewall_rule {
    action    = "drop"
    direction = "in"
  }
}

resource "upcloud_firewall_rules" "fw-mgmt-firewall" {
  server_id = upcloud_server.fw-mgmt.id

  firewall_rule {
    action               = "accept"
    direction            = "in"
    family               = "IPv6"
    protocol             = "tcp"
    source_address_end   = "2a04:3540:53::1"
    source_address_start = "2a04:3540:53::1"
    source_port_end      = "53"
    source_port_start    = "53"
  }

  firewall_rule {
    action               = "accept"
    direction            = "in"
    family               = "IPv6"
    protocol             = "udp"
    source_address_end   = "2a04:3540:53::1"
    source_address_start = "2a04:3540:53::1"
    source_port_end      = "53"
    source_port_start    = "53"
  }

  firewall_rule {
    action               = "accept"
    direction            = "in"
    family               = "IPv6"
    protocol             = "tcp"
    source_address_end   = "2a04:3544:53::1"
    source_address_start = "2a04:3544:53::1"
    source_port_end      = "53"
    source_port_start    = "53"
  }

  firewall_rule {
    action               = "accept"
    direction            = "in"
    family               = "IPv6"
    protocol             = "udp"
    source_address_end   = "2a04:3544:53::1"
    source_address_start = "2a04:3544:53::1"
    source_port_end      = "53"
    source_port_start    = "53"
  }

  firewall_rule {
    action               = "accept"
    direction            = "in"
    family               = "IPv4"
    protocol             = "udp"
    source_address_end   = "94.237.127.9"
    source_address_start = "94.237.127.9"
    source_port_end      = "53"
    source_port_start    = "53"
  }

  firewall_rule {
    action               = "accept"
    direction            = "in"
    family               = "IPv4"
    protocol             = "tcp"
    source_address_end   = "94.237.127.9"
    source_address_start = "94.237.127.9"
    source_port_end      = "53"
    source_port_start    = "53"
  }

  firewall_rule {
    action               = "accept"
    direction            = "in"
    family               = "IPv4"
    protocol             = "udp"
    source_address_end   = "94.237.40.9"
    source_address_start = "94.237.40.9"
    source_port_end      = "53"
    source_port_start    = "53"
  }

  firewall_rule {
    action               = "accept"
    direction            = "in"
    family               = "IPv4"
    protocol             = "tcp"
    source_address_end   = "94.237.40.9"
    source_address_start = "94.237.40.9"
    source_port_end      = "53"
    source_port_start    = "53"
  }

  firewall_rule {
    action               = "accept"
    direction            = "in"
    family               = "IPv4"
    source_address_end   = "83.175.113.160"
    source_address_start = "83.175.113.160"
  }

  firewall_rule {
    action               = "accept"
    direction            = "in"
    family               = "IPv4"
    source_address_end   = "10.255.255.255"
    source_address_start = "10.0.0.0"
  }

  firewall_rule {
    action    = "drop"
    direction = "in"
  }
}
