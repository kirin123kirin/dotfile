@echo off

set INSTALLDIR=Y:\home

set /P INSTALLDIR="�C���X�g�[����t���p�X����͂��Ă�������[%INSTALLDIR%]: "

call :exists %INSTALLDIR%

set suffix="_min"
set ZROOT="Z:\home"
set PROXYADDR=http://proxy.example.com:8080
set MAILADDR=kirin123kirin@gmail.com
set COMPFILE=64bit_min.zip

rem YDrive
call :decompY bin
call :decompY dev\bin
call :decompY dev\lib
call :decompY lib\nvim
call :decompY lib\python3
call :decompY share

rem Zdrive
call :decompZ data
call :decompZ dev\release
call :decompZ etc
call :decompZ libexec
call :decompZ secret
call :decompZ ssl
call :decompZ tmp

xcopy /y %INSTALLDIR%\lib\nvim\bin\win32yank_v0.0.1.exe %INSTALLDIR%\lib\nvim\bin\win32yank.exe
call :proxisettings

del /q %INSTALLDIR%\lib\nvim\bin\win32yank_v0.0.1.exe

call %INSTALLDIR%\dotfiles\_setenv.bat
call :reinstalldotfiles %INSTALLDIR%\dotfiles

rem pip install
mkdir tmp
unzip.exe -d tmp pip.zip pip\*
cd tmp
call install.bat
cd ..
rmdir /s /q tmp

:exists
IF %1 == "" (
	echo �t�H���_���w�肵���
	goto label_error
) ELSE IF NOT EXIST %1 (
	echo ����ȃt�H���_������
	goto label_error
) ELSE (
	call :checkdir %1
)

:reinstalldotfiles
IF EXIST %1 rmdir /s /q %1
unzip.exe -o -d %INSTALLDIR% dotfiles.zip

:checkdir
IF NOT EXIST %1\ (
	echo ����t�H���_����ˁ[��
	goto label_error
)

:proxisettings
git config --global http.proxy %PROXYADDR%
git config --global https.proxy %PROXYADDR%
git config --global user.email %MAILADDR%
git config --global color.ui auto
echo "[global]" > %APPDATA%\pip\pip.ini
echo "proxy = %PROXYADDR%" >> %APPDATA%\pip\pip.ini

:decompY
unzip.exe -o -d %YROOT% %COMPFILE% 64bit_min\%1

:decompZ
unzip.exe -o -d %ZROOT% %COMPFILE% 64bit_min\%1
mklink /J /D %YROOT%\%1 %ZROOT%\%1

REM �G���[����
:label_error
echo �Ƃ�����Œ��~����
goto label_end

REM �I������
:label_end
pause
exit

