# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "03918190-b124-4456-bed7-97de1dc23e00"
resource "upcloud_network" "de-02" {
  labels = {
    dep = "Terraform"
    env = "Prod"
  }
  name   = "de-02"
  router = "0467d85b-c464-4e65-ad6d-f12dd781aa0b"
  zone   = "de-fra1"
  ip_network {
    address            = "10.255.190.0/24"
    dhcp               = true
    dhcp_default_route = true
    dhcp_dns           = ["10.255.192.4", "8.8.8.8"]
    dhcp_routes        = []
    family             = "IPv4"
    gateway            = "10.255.190.1"
  }
}
