::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAnk
::fBw5plQjdG8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFDdRQguUAE+1BaAR7ebv/NahrV8zVdItd4jJ27myIukd1nD0cZc502gUndMJbA==
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@shift /0
::检测更新

@echo off
mode con:cols=77 lines=40
color 0b
cls
echo Please Wait...
echo Secure By JSG
set name=GetNameFailed
for /f "delims=" %%a in (name.txt) do (
set name=%%a
)
for /f "delims=" %%a in (update.txt) do (
set update=%%a
)
for /f "delims=" %%a in (version.txt) do (
set version=%%a
)
update http://update.jamsg.cn/Software/%name%/updatecmd.txt >updatecmd.txt
for /f "delims=" %%a in (updatecmd.txt) do (
set updatecmd=%%a
)
if %name%==GetNameFailed goto GetNameFailed
title JSG-Updater_%name%
:checkupdate
color 0a
cls
echo 获取更新信息...
update http://update.jamsg.cn/Software/%name%/info.txt
echo 当前版本:%version%
echo 最新版本:%update%*
update http://update.jamsg.cn/Software/%name%/update.txt
echo 是否立即下载
echo 1.全量更新(FULL)
echo 2.增量更新(OTA)
echo 0.不更新
set /p choice=
if %choice%==1 goto downloadupdate
if %choice%==2 goto otaupdate
if %choice%==0 goto exit
pause
exit

:downloadupdate
cls
cd ..
.\bin\wget http://update.jamsg.cn/Software/%name%/%name%_%update%.zip
ping -n 3 127.0.0.1 >nul
cls
.\bin\7z.exe x -aoa .\%name%_%update%.zip
del .\%name%_%update%.zip
cls
%updatecmd%
echo 更新完成(FULL)
pause
exit

:otaupdate
cls
cd ..
.\bin\wget http://update.jamsg.cn/Software/%name%/%name%_%version%-%update%_OTA.zip
ping -n 2 127.0.0.1 >nul
cls
.\bin\7z.exe x -aoa .\%name%_%version%-%update%_OTA.zip
del .\%name%_%version%-%update%_OTA.zip
cls
echo 更新完成(OTA)
pause
exit

:GetNameFailed
cls
mode con:cols=37 lines=5
title JSG-Updater 错误
echo JSG-Updater必须和应用程序本体协同工作
echo 不能单一打开
.\bin\echon -c 0A 版本:2.0
echo 按任意键退出
pause >nul
exit

:exit
exit
::检测更新结束