data "vsphere_datacenter" "datacenter" {
  name = var.data-center
}

data "vsphere_datastore" "datastore" {
  name          = "nas01-ssd"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_compute_cluster" "cluster" {
  name          = "Cluster"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "network" {
  name          = "Vlan 70"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_virtual_machine" "template" {
  name          = "ubuntu 20.04"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_datastore" "iso_datastore" {
  name          = "nas"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

resource "vsphere_virtual_machine" "vm" {
  name          = "VM123456789"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id = data.vsphere_datastore.datastore.id
  num_cpus = 12
  memory   = 36

  network_interface {
    network_id = data.vsphere_network.network.id
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
  }
  disk {
    label = "disk0"
    size  = 700
    thin_provisioned = "false"
  }

  guest_id = "ubuntu64Guest"
  firmware = "efi"

}