resource "upcloud_gateway" "vpn-us-ny" {
  name = "vpn-us-ny"
  zone = "us-nyc1"
  plan = "essentials"

  features = ["nat", "vpn"]

  router {
    id = upcloud_router.us-01.id
  }
  labels = {
    Environment = "Test"
    Project     = "IaaS"
    System      = "Network"
    Owner       = "JZAN"
  }
}


resource "upcloud_gateway_connection" "toVeloUS" {
  gateway = upcloud_gateway.vpn-us-ny.id
  name    = "toVeloUS"
  type    = "ipsec"

  local_route {
    name           = "us-01"
    type           = "static"
    static_network = "10.254.197.0/24"
  }

  /* local_route {
    name           = "de-02"
    type           = "static"
    static_network = "10.255.190.0/24"
  }

  local_route {
    name           = "de-03"
    type           = "static"
    static_network = "10.255.191.0/24"
  } */

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
  remote_route {
    name           = "to-sase"
    type           = "static"
    static_network = "172.31.0.0/22"
  }
  remote_route {
    name           = "to-fr"
    type           = "static"
    static_network = "10.255.192.0/22"
  }
  remote_route {
    name           = "backbone"
    type           = "static"
    static_network = "10.10.30.252/31"
  }
}

resource "upcloud_gateway_connection_tunnel" "to-Velo-US" {
  connection_id = upcloud_gateway_connection.toVeloUS.id
  name          = "to-Velo"
  #local_address_name = tolist(upcloud_gateway.this.address).0.name
  local_address_name = tolist(upcloud_gateway.vpn-us-ny.address).0.name
  remote_address     = "136.144.99.57"
  #remote_address = "136.144.99.57"
  ipsec_auth_psk {
    psk = "you_probably_want_to_use_env_vars_here"
  }
}