# packer

# summary

1. Placeholder for all things related to Packer
2. Things I've fallen over during changes

## Debian packer file

1. VMware is very picky about the `"guest_os_type": "debian7-64",` was the only thing that workded which meant nothing built till I got this right...

### ToDo

Change the boot steps to include: -

* Install grub bootloader automatically under dev/sda/ `<down><enter>` keypresses required
* vmx_data settings need to be included.
* consider changing the vagrant post processor to KEEP the build artifacts
* check whether VMWare tools have been installed and make sure this worked!
* can the keyboard config be changed through vagrant/bash? 
    * Add this as an option for the UK since this is currently set to US
* Vagrant Up the fake communicator box and comment out the stuff I need to re-use
    * MUST REMOVE VirtualBox specific settings FIRST before I do this!!
* Begin another repo for Vagrant images
