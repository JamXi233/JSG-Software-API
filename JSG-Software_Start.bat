@echo off
::����������Ƽ�����
color 
set name=
set version=
echo %name%>..\name.txt
echo %version%>..\version.txt
title %name%
set Y=%date:~0,4%
set M=%date:~5,2%
set D=%date:~8,2%
set TH=%time:~0,2%
:DELLEFT
if "%TH:~0,1%"==" " set TH=%TH:~1%&&goto delleft
set TM=%time:~3,2%
:select
title Checking...
set choice=0
echo Ҫ�����ĸ�ģʽ�أ�
echo *Ĭ��Ϊ����ģʽ
echo 0.����ģʽ Normal Mode
echo 1.��ȫģʽ Safe Mode
echo 2.���ģʽ Verbose Mode
title ֱ�ӻس�������ģʽŶ
set /p choice=
if %choice%==0 goto NM
if %choice%==1 goto SM
if %choice%==2 goto VM

:NM
echo -------------------Start------------------->>./bin/logs/%Y%%M%%D%.log
echo %date% %time%:Init...>>./bin/logs/%Y%%M%%D%.log
echo %date% %time%:JSG-Secure>>./bin/logs/%Y%%M%%D%.log
echo %date% %time%:Normal Mode>>./bin/logs/%Y%%M%%D%.log
.\comps\%name%.bat 0
:SM
echo -------------------Start------------------->>./bin/logs/%Y%%M%%D%.log
echo %date% %time%:Init...>>./bin/logs/%Y%%M%%D%.log
echo %date% %time%:JSG-Secure>>./bin/logs/%Y%%M%%D%.log
echo %date% %time%:Safe Mode>>./bin/logs/%Y%%M%%D%.log
.\comps\%name%.bat 1
:VM
echo -------------------Start------------------->>./bin/logs/%Y%%M%%D%.log
echo %date% %time%:Init...>>./bin/logs/%Y%%M%%D%.log
echo %date% %time%:JSG-Secure>>./bin/logs/%Y%%M%%D%.log
echo %date% %time%:Verbose Mode>>./bin/logs/%Y%%M%%D%.log
.\comps\%name%.bat 2