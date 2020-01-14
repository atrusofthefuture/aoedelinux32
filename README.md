# Development repository for Aoede Linux 32-bit

**Aoede Linux is an Arch Linux based audio engineering oriented distribution in the vein of the Ubuntu Studio, AV Linux, and KXStudio projects -- to name only a few of the inspirations for this project.**

**The bulk of the modifications to the Arch-provided "archiso" releng (release engineering) scripts were taken from the Arch Wiki entry on [Professional Audio][1].**

Note: This release is based on the derived work of the 32-bit Arch project archlinux32.org. It is not from the maintainers of the official Arch Linux project. For the 64-bit project see [Aoede Linux](https://github.com/atrusofthefuture/aoedelinux).

### PREREQUISITES:
1. ~11GB hard drive space
2. A running Arch Linux instance with packages "arch-install-scripts" and "archiso" installed; can be a live USB system but keep in mind final builds are ~2GB in size and the intermediate build stage is approx. 7GB. 

### BUILDING:

`$ ./build.sh`

when the build is complete you will find a file named aoedelinux-<date>-i686.iso in the "out" directory at the project root

#### Customization:
Alternatve desktops may be desired, and in the future I may provide alternate package lists for this purpose. For the time being, you will need to remove (or comment out) references to LXDE packages and substitute your desired package group (i.e. gnome, xfce4, etc.). Package groups may be listed with command:

  `$ pacman -Sg`

Or list all member packages in a given group:

`$ pacman -Sg gnome`

### RUNNING:
copy .iso to a USB or DVD medium, or open in a virtual machine
login as user "arch", password is "live"
to start the LXDE graphical desktop environment, execute:

`$ startx`

**Recommendations:
If you have >4GB of RAM, consider inserting 'copytoram=y' into the kernel parameters at the bootloader screen. This command loads the entire image into RAM, which speeds up program execution at the cost of occupying a large portion of active memory. CPU performance may be improved at some cost to security by disabling mitigations with "mitigations=off". It is recommended to turn off wifi if interruptions to live audio capture occur.**

Audio:
  The JACK Audio Connection Kit is a popular routing backend for Linux audio and Aoede includes he qjackctl GUI interface; many audio apps will ask to start JACK, although they do not all require it
  I recommend you take a look at Ardour, a DAW (Digital Audio Workstation), Guitarix (a guitar effects emulator), Yoshimi (synthesizer), and Hydrogen (drum sequencer). 

### TROUBLESHOOTING
My build was interrupted, and I don't want to reinstall the whole filesystem or start from scratch<br>
  -- remove the files starting with "build" from the "work" directory<br>
  -- modify the pacstrap script (`which pacstrap` for path) and add "--needed" flag to call to pacstrap
  
  `if ! unshare --fork --pid pacman --needed -r "$newroot" $pacmode "${pacman_args[@]}"; then`

See [here](https://wiki.archlinux.org/index.php/archiso) for more information

### CONFIG TECHNICALS:
As mentioned, the tweaks are specified in the [Professional Audio][1] article in the Arch Wiki, and the article is included in the /root directory by default

Running diff on this repo against the package-maintainer's stock releng configuration will show where it has been customized. Minor changes have been made to "build.sh" and the bulk is found in airootfs/etc and airootfs/root/customize_airootfs.sh.


[1]: https://wiki.archlinux.org/index.php/Professional_audio/
