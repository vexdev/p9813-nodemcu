# Overview
Sets up a home connected device with support to:
- RGB led stripe connected to HSPI
- WiFi connection

# Setup
The firmware contains the following modules:
`adc` `bit` `cron` `encoder` `file` `gpio` `http` `i2c` `mqtt` `net` `node` `ow` `pwm` `rtcfifo` `rtcmem` `rtctime` `spi` `struct` `tmr` `uart` `wifi`.

## Setup the firmware
First, erase flash:

`esptool.py --port <serial-port-of-ESP8266> erase_flash`

The following command can be used:

`esptool.py --port <serial-port-of-ESP8266> write_flash -fm <mode> 0x00000 <nodemcu-firmware>.bin`

## Create a credentials.lua file
This file should contain the declaration of two variables: `SSID` and `PASSWORD` containing the credentials for the WiFi connection.

## Upload all files on NodeMCU
First, reset the flash to remove any leftover:

`nodemcu-tool mkfs --port=/dev/tty.wchusbserial1410`

Then, upload all files:

`nodemcu-tool upload --port=/dev/cu.wchusbserial1410 *.lua`
`nodemcu-tool upload --port=/dev/cu.wchusbserial1410 *.html`
