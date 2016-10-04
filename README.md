# packer

# summary

1. Placeholder for all things related to Packer
2. Things I've fallen over during changes

## Debian packer file

1. VMware is very picky about the `"guest_os_type": "debian7-64",` was the only thing that workded which meant nothing built till I got this right...

## VMWare packer file

1. There are way more places to fall over in the VMWare packer file setup because I believe that since it's not a FREE option it's less widely documented...
2. Things that I fell over:
    * vmx_data section -- you need to supply the value for `"scsi0.virtualDev": "lsisas1068"` in order to be able to mount the floppy drive and properly execute the autounnattended.xml file
    * `"tools_upload_flavour": "windows"` 
    * `"guest_os_type": "windows8srv-64"` does not follow convention because it's -64 not _64 as well as these being extremely obtuse
3. Being able to VNC onto the machine as it's building is EXTREMELY USEFUL
4. https://github.com/mwrock/packer-templates/issues/49 This error was encountered << changed the files - currently in progress
5. Find out from Boxstarter config either how to load this locally
    * Temporarily remove the need to have all the windows upgrades applied which is in the boxstarter file

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
