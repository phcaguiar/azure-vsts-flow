# Stone Payments - LVM
Ansible role to create, remove, mount and umount a single Linux Volume Manager (LVM)

## Requirements
You will need to install the requirements using: `pip install -r requirements.txt`

## Role Variables
To see role variables:
 * [defaults](defaults/main.yml)
 * `lvm_create`: default value is `True`. Set `True` to create a Volume Group (VG) and LVM or `False` to remove a single VG and LVM.

## Example Playbook
```yaml
- hosts: servers
  vars:
    lvm_pvs_name: /dev/sdb
    lvm_vg_name: vg
    lvm_lv_name: lv
    lvm_fstype: xfs
    lvm_mount_point_path: /data
    lvm_mount_point_owner: root
    lvm_mount_point_group: root
    lvm_mount_point_opts: defaults
  roles:
    - role: stone-payments.lvm
```

## Testing
This role implements unit tests with Molecul and Vagrant. Notice that we only support Molecule 2.0 or greater. You can install molecule with:

```shell
pip install molecule
```

After having Molecule setup, you can run the tests with:

```shell
molecule test
```

## Contributing
Just open a PR. We love PRs!

## License
MIT