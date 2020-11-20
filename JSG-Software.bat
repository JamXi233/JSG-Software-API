::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFDdRQguUAE+1BaAR7ebv/NahrV8zVdItd4jJ27mycrBBuhW8JM99hC8KzZJdWk9nexO4dwY3pmB9uGGRCJbO60HoSUfp
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpSI=
::egkzugNsPRvcWATEpSI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJiZkkaHErSXA==
::ZQ05rAF9IBncCkqN+0xwdVsGAlbMbCXqZg==
::ZQ05rAF9IAHYFVzEqQIWJwl6TTSQM2yoB7h8
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWHO30wxQ
::YQ03rBFzNR3SWATE3kM9Gzw0
::dhAmsQZ3MwfNWATE3nEXaChAQxaDO276IacT/fib
::ZQ0/vhVqMQ3MEVWAtB9wER5HLA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFDdRQguUAE+1BaAR7ebv/NahrV8zVdItd4jJ27myIukd1mPrZ7gs5mhVn9kNAVVdZhfL
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
:Start
::设置主目录
cd bin
::设置软件名称及代号
set name=
set version=
echo %name%>..\bin\name.txt
echo %version%>..\bin\version.txt
title %name%
set Y=%date:~0,4%
set M=%date:~5,2%
set D=%date:~8,2%
set TH=%time:~0,2%
:DELLEFT
if "%TH:~0,1%"==" " set TH=%TH:~1%&&goto delleft
set TM=%time:~3,2%
::FOR
set par=%1%
if %par%==0 set programstatus=normal&echo off
if %par%==1 set programstatus=mini&echo off&goto main
if %par%==2 set programstatus=Debug&echo on
::应用前执行

::检测更新
mode con:cols=57 lines=30
color 0b
set programstatus=normal
cls
echo Please Wait...
echo Secure By JSG
:retrycheck
cls
echo Please Wait...
echo Secure By JSG
echo 尝试连接到JSG更新服务器...
ping -n 1 jam233.tpddns.cn >nul
if %errorlevel%==1 goto networkerror
echo %date% %time%:Network Normal>>./logs/%Y%%M%%D%.log
update http://update.jamsg.cn/Software/status.txt >status.txt
for /f "delims=" %%a in (status.txt) do (
set status=%%a
)
del status.txt
if %status%==1 goto servererror
if %errorlevel%==0 goto testversion

:networkerror
echo %date% %time%:Network Error>>./logs/%Y%%M%%D%.log
cls
echo 无法连接到JSG更新服务器 请选择项目:
echo 1.重试
echo 2.直接进入
set /p choice=
if %choice%==1 goto retrycheck
if %choice%==2 goto main
color 0e
:testversion
setlocal enabledelayedexpansion 
update http://update.jamsg.cn/Software/%name%/updatever.txt >update.txt
for /f "delims=" %%a in (update.txt) do (
set update=%%a
)

update http://update.jamsg.cn/Software/%name%/died.txt >died.txt
for /f "delims=" %%a in (died.txt) do (
set died=%%a
)
del died.txt

cls
color c
update http://update.jamsg.cn/Software/welcome.txt
echo 当前版本为:%version%
ping -n 1 127.0.0.1 >nul
if %died%==1 goto died
if %update%==%version% goto main

:checkupdate
Echo wscript.Echo MsgBox ("%name%检查到更新,新版本号为%update%,是否开始更新", 36, "JSG-Updater")>tmp.vbs
For /f %%i in ('cscript /nologo tmp.vbs') do If %%i==6 start ..\comps\Updater.bat
Del /q tmp.vbs
goto main

:downloadupdate
cls
wget http://update.jamsg.cn/Software/%name%/%name%_%update%.zip -P ../
pause
exit

:died
cls
mode con:cols=77 lines=37
color 4f
update.exe http://update.jamsg.cn/Software/died.txt
pause
exit

:servererror
cls
mode con:cols=33 lines=35
color 4f
update.exe http://update.jamsg.cn/status.txt
pause
exit

::检测更新结束
:main
cls
mode con:cols=57 lines=41
title 

:exit
echo %date% %time%:Normal Exit>>./logs/%Y%%M%%D%.log
echo --------------------END-------------------->>./logs/%Y%%M%%D%.log
exit