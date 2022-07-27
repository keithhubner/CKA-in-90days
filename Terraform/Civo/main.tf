# Query small instance size

# IMPORTANT - There is currently a bug in the Civo provider when trying to destroy the environment, this is currently being investigated. This results in manually deleting the network and firewall from Civo and resetting the terraform state.

data "civo_size" "small" {
    filter {
        key = "name"
        values = ["g3.small"]
        match_by = "re"
    }

    filter {
        key = "type"
        values = ["instance"]
    }

}

# Query instance disk image
data "civo_disk_image" "ubuntu" {
   region = "LON1"
   filter {
        key = "name"
        values = ["ubuntu-jammy"]
   }
}

data "external" "myipaddr" {
program = ["bash", "-c", "curl -s 'https://api.ipify.org?format=json'"]
}


variable "ssh_key_ID" {}

# Create a network
resource "civo_network" "custom_network" {
    label = "lab-network"
    region = "LON1"
}

# Create a firewall
resource "civo_firewall" "lab_firewall" {
    name = "ssh"
    network_id = civo_network.custom_network.id
    region = "LON1"
    create_default_rules = false
    depends_on = [
    civo_network.custom_network
    ]
}

# Create a firewall rule
resource "civo_firewall_rule" "ssh" {
    firewall_id = civo_firewall.lab_firewall.id
    protocol = "tcp"
    start_port = "22"
    end_port = "22"
    cidr = ["${data.external.myipaddr.result.ip}"]
    direction = "ingress"
    label = "ssh"
    action = "allow"
    depends_on = [civo_firewall.lab_firewall]
}

resource "civo_firewall_rule" "deny_tcp" {
    firewall_id = civo_firewall.lab_firewall.id
    protocol = "tcp"
    start_port = "1"
    end_port = "65535"
    cidr = ["0.0.0.0/0"]
    direction = "ingress"
    label = "deny_all_tcp"
    action = "deny"
    depends_on = [civo_firewall.lab_firewall]
}

# Create a new instance
resource "civo_instance" "control" {
    region = "LON1"
    hostname = "k8s-control"
    size = element(data.civo_size.small.sizes, 0).name
    disk_image = element(data.civo_disk_image.ubuntu.diskimages, 0).id
    sshkey_id = var.ssh_key_ID
    network_id = civo_network.custom_network.id
    firewall_id = civo_firewall.lab_firewall.id
    depends_on = [
    civo_network.custom_network
    ]
}

resource "civo_instance" "node1" {
    region = "LON1"
    hostname = "k8s-node1"
    size = element(data.civo_size.small.sizes, 0).name
    disk_image = element(data.civo_disk_image.ubuntu.diskimages, 0).id
    sshkey_id = var.ssh_key_ID
    network_id = civo_network.custom_network.id
    firewall_id = civo_firewall.lab_firewall.id
    depends_on = [
    civo_network.custom_network
    ]
}

resource "civo_instance" "node2" {
    region = "LON1"
    hostname = "k8s-node2"
    size = element(data.civo_size.small.sizes, 0).name
    disk_image = element(data.civo_disk_image.ubuntu.diskimages, 0).id
    sshkey_id = var.ssh_key_ID
    network_id = civo_network.custom_network.id
    firewall_id = civo_firewall.lab_firewall.id
    depends_on = [
    civo_network.custom_network
    ]
}



