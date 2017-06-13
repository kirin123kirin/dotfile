@echo off

set INSTALLDIR=C:\home

set /P INSTALLDIR="インストール先フルパスを入力してください[%INSTALLDIR%]: "

call :exists %INSTALLDIR%

set answer="n"
set /p answer="最小限のインストールにしますか(y/N)？: "
if %answer%=="Y" set anser="y"
if "%answer%"=="y" (
	set suffix=""
) else if "%answer%"=="n" ( 
	set suffix="_min"
)else (
	echo "質問通りに答えろよ y or n"
	goto label_error
)

if "%PROCESSOR_ARCHITECTURE%" == "x86" (
	echo "32bit installineg now"
	unzip.exe -o -d %INSTALLDIR% 32bit%suffix%.zip 32bit%suffix%\*
) else (
	echo "64bit installing now"
	unzip.exe -o -d %INSTALLDIR% 64bit%suffix%.zip 64bit%suffix%\*
)

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
	echo フォルダを指定しろよ
	goto label_error
) ELSE IF NOT EXIST %1 (
	echo そんなフォルダ無いよ
	goto label_error
) ELSE (
	call :checkdir %1
)

:reinstalldotfiles
IF EXIST %1 rmdir /s /q %1
unzip.exe -o -d %INSTALLDIR% dotfiles.zip

:checkdir
IF NOT EXIST %1\ (
	echo これフォルダじゃねーし
	goto label_error
)

:proxisettings
git config --global http.proxy %PROXYADDR%
git config --global https.proxy %PROXYADDR%
git config --global user.email %MAILADDR%
git config --global color.ui auto
echo "[global]" > %APPDATA%\pip\pip.ini
echo "proxy = %PROXYADDR%" >> %APPDATA%\pip\pip.ini

REM エラー処理
:label_error
echo という訳で中止する
goto label_end

REM 終了処理
:label_end
pause
exit

