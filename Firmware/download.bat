@echo off

@echo ********************************************************************************
@echo 				AC692x Download  ...			
@echo ********************************************************************************
@echo %date%

cd %~dp0

if exist uboot.boot del uboot.boot
type uboot.bin > uboot.boot

@rem �����¼�ļ���ӦԴ����
@rem ����������Ҳ���Դ���������£����ǿ��԰����ǽ�ѹ����Ӧ��Դ���루Ĭ�Ϲرգ�
rem SourcePack --proj ../../../../ --out AC692x_sdk_zip --extra .sbc .wav .raw .log .fw .res .ini .mp3

cd tone_resource
copy *.mp3 ..\
cd ..

cd ui_resource
copy *.* ..\
cd ..

@rem �ļ������б�
isd_download.exe -tonorflash -dev br21 -boot 0x2000 -div6 -wait 300  -f uboot.boot sdk.app bt_cfg.bin F_ASCII_S.PIX F_GB2312_S.PIX F_GB2312.TAB menu.res ui_sty.sty

@rem ɾ����ʱ�ļ�
if exist *.mp3 del *.mp3 
if exist *.PIX del *.PIX
if exist *.TAB del *.TAB
if exist *.res del *.res
if exist *.sty del *.sty
if exist jl_692x.bin del jl_692x.bin

@rem ���������ļ�
rename jl_isd.bin jl_692x.bin
bfumake.exe -fi jl_692x.bin -ld 0x0000 -rd 0x0000 -fo updata.bfu

IF EXIST jl_692x.bin del jl_692x.bin 
del no_isd_file

@rem ��������˵��
@rem -format vm        //����VM ����
@rem -format cfg       //����BT CFG ����
@rem -format 0x3f0-2   //��ʾ�ӵ� 0x3f0 �� sector ��ʼ�������� 2 �� sector(��һ������Ϊ16���ƻ�10���ƶ��ɣ��ڶ�������������10����)

ping /n 2 127.1>null
IF EXIST null del null
::pause

