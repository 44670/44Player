# Firmware

# Flashing the chip

If the chip is empty, it will enter the download mode automatically when you connect it to the USB port. Otherwise, you may need the "force-download" tool.

To flash the firmware, you need to obtain the `AC692x_SDK_release_V2.6.3` from the reseller of the JieLi. 

After you install the SDK, copy `sdk.app, flashme.bat` file to `AC692x_SDK_release_V2.6.3\apps\download\post_build\flash` folder.

Then you can flash the firmware by running `flashme.bat` **as Administrator** while the device is connected to the computer.

