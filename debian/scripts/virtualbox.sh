if test -f .vbox_version ; then
  # The netboot installs the VirtualBox support (old) so we have to remove it
  if test -f /etc/init.d/virtualbox-ose-guest-utils ; then
    /etc/init.d/virtualbox-ose-guest-utils stop
  fi

  rmmod vboxguest
  aptitude -y purge virtualbox-ose-guest-x11 virtualbox-ose-guest-dkms virtualbox-ose-guest-utils

  # Install dkms for dynamic compiles

  apt-get install -y dkms

  # If libdbus is not installed, virtualbox will not autostart
  apt-get -y install --no-install-recommends libdbus-1-3

  # Install the VirtualBox guest additions
  mount -o loop VBoxGuestAdditions.iso /mnt
  yes|sh /mnt/VBoxLinuxAdditions.run
  umount /mnt
  rm -f VBoxLinuxAdditions.iso

  # Start the newly build driver <-- commented this out due to issues in 5.0.6 and above VirtualBox
  # /etc/init.d/vboxadd start <-- https://github.com/dotless-de/vagrant-vbguest/issues/170

  # vagrant-vbguest 0.10.1 requirement
  if [ ! -f /etc/init.d/vboxadd ]
    then
      vboxadd=$(find /opt -name vboxadd | head -n 1)
        if [ -f "$vboxadd" ]
      then
        ln -s $vboxadd /etc/init.d
      fi
  fi
fi
