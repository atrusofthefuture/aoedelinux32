# Development repository for Aoede Linux

**Aoede Linux is an Arch Linux based audio engineering oriented distribution in the vein of the Ubuntu Studio, AV Linux, and KXStudio projects -- to name only a few of the inspirations for this project.

The bulk of the modifications to the Arch-provided "archiso" releng (release engineering) scripts were taken from the Arch Wiki entry on [Professional Audio][1].** 

### PREREQUISITES:
1. >5GB hard drive space
2. A running Arch Linux instance with packages "arch-install-scripts" and "archiso" installed; can be a live USB system but keep in mind final builds are ~2GB in size and the intermediate build stage is larger

### BUILDING:

`$ ./build.sh`

when the build is complete you will find a file named aoedelinux-<date>-i686.iso in the "out" directory at the project root

### RUNNING:
copy .iso to a USB or DVD medium, or open in a virtual machine
login as user "arch", password is "live"
to start the LXDE graphical desktop environment, execute:

`$ startx`

**Recommendations:
If you have >4GB of RAM, consider inserting 'copytoram=y' into the kernel parameters at the bootloader screen. This command loads the entire image into RAM, which speeds up program execution at the cost of occupying a large portion of active memory.

Audio:
  The JACK Audio Connection Kit is a popular routing backend for Linux audio and Aoede includes he qjackctl GUI interface; many audio apps will ask to start JACK, although they do not all require it
  I recommend you take a look at Ardour, a DAW (Digital Audio Workstation), Guitarix (a guitar effects emulator), Yoshimi (synthesizer), and Hydrogen (drum sequencer). 

### TROUBLESHOOTING
My build was interrupted, and I don't want to reinstall the whole filesystem or start from scratch<br>
  -- remove the files starting with "build" from the "work" directory<br>
  -- modify the pacstrap script (`which pacstrap` for path) and add "--needed" flag to call to pacstrap ## check notes on this detail
  
  `if ! unshare --fork --pid pacman --ignore adljack --ignore mixxx --needed -r "$newroot" $pacmode "${pacman_args[@]}"; then`

See [here](https://wiki.archlinux.org/index.php/archiso) for more information

### CONFIG TECHNICALS:
As mentioned, the tweaks are specified in the [Professional Audio][1] article in the Arch Wiki, and the article is included in the /root directory by default



[1]: https://wiki.archlinux.org/index.php/Professional_audio/
