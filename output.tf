data "template_file" "ansible_hosts" {
  template = "${file("files/ansible_hosts.tpl")}"
  vars {
    azure_hosts = "${azurerm_public_ip.pubip.ip_address}"
  }
}
output "ansible_hosts" {
    value = "${data.template_file.ansible_hosts.rendered}"
}