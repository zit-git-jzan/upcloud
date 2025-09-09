resource "upcloud_gateway" "vpn-de-fra" {
  name = "vpn-de-fra"
  zone = "de-fra1"
  plan = "essentials"

  features = ["nat", "vpn"]

  router {
    id = upcloud_router.de-01.id
  }
  labels = {
    Environment = "Prod"
    Project     = "IaaS"
    System      = "Network"
    Owner       = "JZAN"
  }
}
resource "upcloud_gateway_connection" "toVelo" {
  gateway = upcloud_gateway.vpn-de-fra.id
  name    = "toVelo"
  type    = "ipsec"

  local_route {
    name           = "de-01"
    type           = "static"
    static_network = "10.255.192.0/22"
  }

  remote_route {
    name           = "to-dc"
    type           = "static"
    static_network = "192.168.128.0/24"
  }

  remote_route {
    name           = "to-schmelz"
    type           = "static"
    static_network = "10.255.102.0/24"
  }
  remote_route {
    name           = "to-ottakring"
    type           = "static"
    static_network = "10.255.101.0/24"
  }
  remote_route {
    name           = "to-pvt-230"
    type           = "static"
    static_network = "10.255.230.0/24"
  }
  remote_route {
    name           = "to-pvt-224"
    type           = "static"
    static_network = "10.255.224.0/24"
  }
}

resource "upcloud_gateway_connection_tunnel" "to-Velo" {
  connection_id = upcloud_gateway_connection.toVelo.id
  name          = "to-Velo"
  #local_address_name = tolist(upcloud_gateway.this.address).0.name
  local_address_name = tolist(upcloud_gateway.vpn-de-fra.address).0.name
  remote_address     = "152.65.233.127"

  ipsec_auth_psk {
    psk = "you_probably_want_to_use_env_vars_here"
  }
}