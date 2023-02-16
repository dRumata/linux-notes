https://blog.stackattack.net/2017/02/04/tp-link-tg-3468-and-vmware-esxi-6-5/

This is a quick note for anyone who is looking for a cheap gigabit Ethernet PCI-E card for their ESXi 6.5 system: the TP-Link TG-3468 works well, and is only about $12.  It’s not supported natively, however, so you have to do the following:

1. Shutdown your ESXi system and install the card
2. Reboot the system
3. Login and enable SSH and the ESXCLI interfaces
4. Upload the net55-r8168-8.039.01-napi.x86_64.vib file (from this repo or [second download link](https://storage.googleapis.com/files.stackattack.net/net55-r8168-8.039.01-napi.x86_64.vib), right-click and “Save as…”) somewhere on the system (I just placed mine in one of my datastores)
5. Login via SSH as an administrator to the ESXi system
6. Allow community supported vSphere Installation Bundles (VIB):
```
esxcli software acceptance set --level=CommunitySupported
```
Install the new VIB:
```
esxcli software vib install -v /full/path/to/net55-r8168-8.039.01-napi.x86_64.vib
```
>NOTE: You must use the full path. Even relative paths won’t work for some reason
7. Reboot your system
8. Done
