# aoedelinux32

<h1>Development repository for Aoede Linux 32-bit</h1>

<strong>Aoede Linux is an Arch Linux based audio engineering oriented distribution in the vein of the Ubuntu Studio, AV Linux, and KXStudio projects -- to name only a few of the inspirations for this project.

The bulk of the modifications to the Arch-provided "archiso" releng (release engineering) scripts were taken from the Arch Wiki entry on [Professional Audio][1]. 
</strong> 

<h3>PREREQUISITES:</h3>
1. >5GB hard drive space<br>
2. A running Arch Linux instance with packages "arch-install-scripts" and "archiso" installed; can be a live USB system but keep in mind final builds are ~2GB in size and the intermediate build stage is larger<br>

<h3>BUILDING:</h3>

`$ ./build.sh`

when the build is complete you will find a file named aoedelinux-<date>-i686.iso in the "out" directory at the project root

<h3>RUNNING:</h3>
copy .iso to a USB or DVD medium, or open in a virtual machine<br>
login as user "arch", password is "live"<br>
to start the LXDE graphical desktop environment, execute:<br>

`$ startx`

<strong>Recommendations:</strong>
If you have >4GB of RAM, consider inserting 'copytoram=y' into the kernel parameters at the bootloader screen. This command loads the entire image into RAM, which speeds up program execution at the cost of occupying a large portion of active memory.

<h3>Audio:</h3>
  The JACK Audio Connection Kit is a popular routing backend for Linux audio and Aoede includes he qjackctl GUI interface; many audio apps will ask to start JACK, although they do not all require it<br>
  I recommend you take a look at Ardour, a DAW (Digital Audio Workstation), Guitarix (a guitar effects emulator), Yoshimi (synthesizer), and Hydrogen (drum sequencer). 

<h3>TROUBLESHOOTING</h3>
My build was interrupted, and I don't want to reinstall the whole filesystem or start from scratch<br>
  -- remove the files ending in ".build" from the "work" directory<br>
  -- modify the pacstrap script (`which pacstrap` for path) and add "--if-needed" flag to call to pacstrap ## check notes on this detail

See [here](https://wiki.archlinux.org/index.php/archiso) for more information

<h3>CONFIG TECHNICALS:</h3>
As mentioned, the tweaks are specified in the [Professional Audio][1] article in the Arch Wiki, and the article is included in the /root directory by default



[1]: https://wiki.archlinux.org/index.php/Professional_audio/
