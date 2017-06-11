cd %~dp0
cd ..\..\

set YROOT="Y:\home"
set ZROOT="Z:\home"

rem YDrive
call :moveY bin
call :moveY dev\bin
call :moveY dev\lib
call :moveY dotfiles
call :moveY lib\nvim
call :moveY lib\python3
call :moveY share

rem Zdrive
call :moveZ data
call :moveZ dev\release
call :moveZ etc
call :moveZ dts
call :moveZ libexec
call :moveZ secret
call :moveZ ssl
call :moveZ tmp

call "%YROOT%\dotfiles\_setenv.bat"
call "%ZROOT%\dts\_setenvDTS.bat"

:moveY
xcopy /E /H /K %1 %YROOT%\%1

:moveZ
xcopy /E /H /K %1 %ZROOT%\%1
mklink /J /D %YROOT%\%1 %ZROOT%\%1

