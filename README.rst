USB-ified IBM Model F XT w/Soarer
=================================

This isn't a detailed guide for how to use Soarer to USB-ify a Model F XT,
but has a Makefile to run some of the steps and my `layout.txt <layout.txt>`__.

* `Model F XT background <https://www.seasip.info/VintagePC/ibm_1501105.html>`__
* `Much more detailed Soarer flashing guide <https://deskthority.net/viewtopic.php?p=413708#p413708>`__

Downloading Soarer
------------------

Run the following to download and unpack Soarer 1.12::

    make soarer

Installing to an Leonardo Pro Micro
----------------------------------

Use avrdude as per guid above to flash ``soarer/firmware/Soarer_at2usb_v1.12_atmega32u4.hex``.

Wiring into XT keyboard
-----------------------

Internal XT connector wiring scheme, only the topmost (chip-side)
row of pins used, the other row unconnected::

   [ ]
   [x] Brown --> 5 (VCC)
   [ ]
   [x] Red   --> 4 (GND)
   [x] White --> 2 (Data)
   [x] Black --> 1 (Clock
   [ ] 

Colouring scheme of my cable, based on randomly chosen wires::
 
    Purple
    x
    Blue
    Yellow
    Grey

Building & writing config
-------------------------

To reconfigure the keyboard, you first need to allow your user to write to it::

    $ # Find the bus/device for the keyboard
    $ lsusb | grep "Teensy Keyboard"
    Bus 001 Device 016: ID 16c0:047d Van Ooijen Technische Informatica Teensy Keyboard+Debug
    $ # Then, temporarily, let anyone write to it:
    $ sudo chmod a+rw /dev/bus/usb/001/016

Then build and write ``layout.bin`` to the keyboard with::

    make write

You'll need to disconnect / reconnect once written.
