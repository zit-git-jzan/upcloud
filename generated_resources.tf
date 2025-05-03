# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "1007be25-4e31-4ecc-bde8-f9d04982b10b"
resource "upcloud_gateway" "nat-gw-de-fra1" {
  configured_status = "started"
  features          = ["nat", "vpn"]
  labels            = {}
  name              = "nat-gw-de-fra1"
  plan              = "standard"
  zone              = "de-fra1"
  address {
    name = "public-ip-1"
  }
  router {
    id = "0467d85b-c464-4e65-ad6d-f12dd781aa0b"
  }
}
