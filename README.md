# What is this packer file?

This is a vmware packer file which will create a .box file for use with Vagrant and a bunch of VMWare .vmdk files for VMWare Workstation.

The starting point was Matt Wrock's ridiculously excellent blog and repo also on Github. This is a vmware version of his vbox-2012r2-wmf5.json file which is available here.

https://github.com/mwrock/packer-templates

# Using this version. 

1. Check I've not missed anything out from Matt's repo (scripts especially) when I copied my changes back into this repo! I am coming back to this about 3 weeks after I began
2. https://github.com/mwrock/packer-templates/issues/49 This error was encountered << changed seemed to have worked - see comments in PackerShutdown.bat and SetupComplete-2012.cmd
3. You definitely need to implement Matt's packer templates pre-requisites before attempting to run this

# Other specific changes  

1. Uses VMXNET3 ethernet settings (hence the need to add the drivers to the floppy list) which also meant making sure the vmx section of the template references the default eth0 as vmxnet3 as well otherwise the machine reboots but can't regain a network connection
2. Uses PVSCSI - again this means that the driver files need to be added to the floppy for this to work at all

# Advice - Logging

Just turn all this on where possible because there's absolutely no guarantee that you'll get this right first time. 

https://www.packer.io/docs/other/debugging.html

If you use Powershell like I do: -

$env:PACKER_LOG=1
$env:PACKER_LOG_PATH="packerlog.txt"
packer build vmware-2012r2-wmf5.json

I did think about turning off the 'auto-update' section of the box-starter/auto-unattended.xml file which takes 8 HOURS to complete what is currently >220 security updates. You don't want to run this then be unable to find out why/where it failed... 

Don't use the results of running this process to create a VM that you're going to then use in production. There's no real security implemented because this was created to drive our development environment, not for deployment.
