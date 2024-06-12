#!/bin/bash

# Define the necessary variables
BaseArgs="--chip esp32 --baud 921600"
SetupArgs="--before default_reset --after hard_reset write_flash -z --flash_mode dio --flash_freq 80m --flash_size detect"

# Define file locations
Bootloader="0x1000 ./bootloader.bin"
Bootapp="0xe000 ./boot_app0.bin"
Firmware="0x10000 ./firmware.bin"
Partitions="0x8000 ./partitions.bin"

# Echo the command to be executed
echo esptool $BaseArgs $SetupArgs $Bootloader $Bootapp $Firmware $Partitions

# Execute the command
esptool $BaseArgs $SetupArgs $Bootloader $Bootapp $Firmware $Partitions
