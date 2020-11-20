@echo off
::设置软件名称及代号
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
echo 要进入哪个模式呢？
echo *默认为正常模式
echo 0.正常模式 Normal Mode
echo 1.安全模式 Safe Mode
echo 2.诊断模式 Verbose Mode
title 直接回车是正常模式哦
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