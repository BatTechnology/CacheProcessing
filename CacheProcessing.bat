@echo off
set ver=1.1
title CacheProcessing v%ver% - %date% %time:~0,-6%
echo Press and hold enter to continue...
echo %temp%
echo %windir%\temp
echo %userprofile%\cookies
setlocal enabledelayedexpansion 
set t=
for /l %%a in (1 1 80) do (
	set "t=>!t!"
	set /p=!t!nul
)
endlocal
cls
echo.
echo ���ڼ��ؽ���(%date:~0,-4%)����...
echo.
echo ���ڼ��� %temp% ������: [%time%]
mshta "javascript:document.write();setTimeout('close()',300);"
for /r %temp% %%i in (*.*) do echo %%i
echo.
echo ���ڼ��� %windir%\temp ������: [%time%]
mshta "javascript:document.write();setTimeout('close()',300);"
for /r %windir%\temp %%i in (*.*) do echo %%i
echo.
echo ���ڼ��� %userprofile%\cookies ������: [%time%]
mshta "javascript:document.write();setTimeout('close()',300);"
for /r "%userprofile%\cookies" %%i in (*.*) do echo %%i
echo.
echo ���ڼ��� %systemdrive% ������: [%time%]
mshta "javascript:document.write();setTimeout('close()',500);"
for /r %systemdrive% %%i in (*.tmp) do echo %%i
for /r %systemdrive% %%i in (*._mp) do echo %%i
for /r %systemdrive% %%i in (*.log) do echo %%i
for /r %systemdrive% %%i in (*.gid) do echo %%i
for /r %systemdrive% %%i in (*.chk) do echo %%i
for /r %systemdrive% %%i in (*.old) do echo %%i
for /r "%systemdrive%\recycled" %%i in (*.*) do echo %%i
echo ������ɣ��Ƿ������(Y/N) Enterȷ��
set /p choose=
if /i "%choose%"=="Y" call :CleanTemp
pause>nul&exit

:CleanTemp
echo.
echo ����ִ�� ������� ...
echo.
echo. �������� "%temp%" ����
mshta "javascript:document.write();setTimeout('close()',300);"
for /r %temp% %%i in (*.*) do (
echo ����� %%i ...
del /q %%i
)
echo.
echo. �������� "%windir%\temp" ����
mshta "javascript:document.write();setTimeout('close()',300);"
rd /s /q %windir%\temp & md %windir%\temp
echo.
echo. �������� "%userprofile%\cookies" ����
mshta "javascript:document.write();setTimeout('close()',300);"
for /r "%userprofile%\cookies" %%i in (*.*) do (
echo ����� %%i ...
del /f /q %%i
)
echo.
echo. �������� %systemdrive% ����
mshta "javascript:document.write();setTimeout('close()',300);"
echo  %systemdrive% Deleting
del /f /s /q %systemdrive%\*.tmp
del /f /s /q %systemdrive%\*._mp
del /f /s /q %systemdrive%\*.log
del /f /s /q %systemdrive%\*.gid
del /f /s /q %systemdrive%\*.chk
del /f /s /q %systemdrive%\*.old
del /f /s /q %systemdrive%\recycled\*.*
mshta "javascript:document.write();setTimeout('close()',300);"
echo over