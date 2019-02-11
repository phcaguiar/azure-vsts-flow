import os

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']).get_hosts('all')


def test_mount_point_path(host):
    ansible = host.ansible.get_variables()
    directory = host.file(ansible['lvm_mount_point_path'])

    assert directory.exists
    assert directory.is_directory
    assert directory.user == ansible['lvm_mount_point_owner']
    assert directory.group == ansible['lvm_mount_point_owner']


def test_mount_exists(host):
    ansible = host.ansible.get_variables()
    mount_point = host.mount_point(ansible['lvm_mount_point_path'])

    assert mount_point.exists


def test_device(host):
    ansible = host.ansible.get_variables()
    mount_point = host.mount_point(ansible['lvm_mount_point_path'])
    device = '/dev/mapper/'+ansible['lvm_vg_name']+'-'+ansible['lvm_lv_name']

    assert mount_point.device == device


def test_filesystem(host):
    ansible = host.ansible.get_variables()
    mount_point = host.mount_point(ansible['lvm_mount_point_path'])
    filesystem = ansible['lvm_fstype']

    assert mount_point.filesystem == filesystem
