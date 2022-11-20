
cd %~dp0

if exist uboot.boot del uboot.boot
type uboot.bin > uboot.boot

cd ui_resource
copy *.* ..\
cd ..

isd_download.exe -tonorflash -dev br21 -boot 0x2000 -div6 -wait 300  -f uboot.boot sdk.app bt_cfg.bin F_ASCII_S.PIX F_GB2312_S.PIX F_GB2312.TAB menu.res ui_sty.sty


pause
