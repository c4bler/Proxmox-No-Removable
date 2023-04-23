# Proxmox-No-Removable
Hide Windows Devices from Showing as 'Removable' - Powershell

Useful for Proxmox VMs that show network devices as removable. I accidentally clicked it so I thought to remove it and made this script.

It removes the '4' bit set from the binary representation of the "Capabilities" key, which specifies if the device is visible as a removable device.

Careful, because ALL devices that are currently in the menu may be marked as internal, YMMV.
