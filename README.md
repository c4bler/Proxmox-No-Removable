# Proxmox-No-Removable
##Hide Windows Devices from Showing as 'Removable' - Powershell

Useful for Proxmox VMs that show network devices as removable. I accidentally clicked it so I thought to remove it and made this script.

It removes the '4' bit set from the binary representation of the "Capabilities" key, which specifies if the device is visible as a removable device.

Careful, because ALL devices that are currently in the menu may be marked as internal, YMMV.

Whilst others report it working if you use 'q35' version 6.0, I prefer to use the latest version, however it has this issue present.
You could also disable the hotplug feature in the VM options, but I preferred not to.

##References
https://forum.proxmox.com/threads/windows-guests-prompting-safely-remove-hardware-for-critical-devices.17490/
https://github.com/virtio-win/kvm-guest-drivers-windows/issues/366
