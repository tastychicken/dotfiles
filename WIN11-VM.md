# Setup

## Download Windows media
Ref: https://www.microsoft.com/en-us/software-download/windows11

## Setup Win11 VM in `virt-manager`
TODO

## Setup Copy/Paste
Ref: https://gitlab.freedesktop.org/spice/win32/spice-nsis/-/issues/16

Virtio guest tools: https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/latest-virtio/virtio-win-guest-tools.exe
Spice guest tools: https://www.spice-space.org/download/windows/spice-guest-tools/spice-guest-tools-latest.exe

Both need to be installed on the windows machine.

Setup channels on VM in `virt-manager`:  
- Open the VM in `virt-manager` and go to its settings.
- Click the 'Add hardware' button on the bottom left.
- Click the 'Channel' option and name it: org.qemu.guest_agent.0
- Verify device type switches to `UNIX socket (unix)`.

Now copy and paste should work.

## Setup Fileshare

- Go to the VM settings in `virt-manager`.
- Click the 'Memory' option in the left-hand menu.
- Check the 'Enable shared memory' option.
- Go to the 'Filesystem' option in the left-hand menu.
- Set the driver to `virtiofs`, set the source path to your home and the target path to /share

Install the virtiofsp on the windows machine:  
https://virtio-fs.gitlab.io/howto-windows.html

## Setup Video Driver

- Click the 'Video <X>' button in the left-hand menu.
- Change the 'Model' for video to 'QXL'

This enables better resolutions.

To get auto resize to work with all kinds of resolution we need the correct guest tools installed:  
https://pve.proxmox.com/wiki/Windows_VirtIO_Drivers

After that we need to change the QXL XML to something similar to:  
```
<video>
  <model type="qxl" ram="131072" vram="65536" vgamem="65536" heads="1" primary="yes"/>
  <alias name="video0"/>
  <address type="pci" domain="0x0000" bus="0x00" slot="0x01" function="0x0"/>
</video>
```

The main part here is the `vgamem` attribute on the `model` tag. The defaults are usually to low to allow proper ultra-wide resolutions.
