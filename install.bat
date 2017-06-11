@echo off

set INSTALLDIR=Y:\home

set /P INSTALLDIR="インストール先フルパスを入力してください[%INSTALLDIR%]: "

call :exists %INSTALLDIR%

set answer="y"
set /p answer="DTSクライアントへのインストールですか(Y/n)？: "
if %answer%=="Y" set anser="y"
if "%answer%"=="y" (
	set suffix="_min"
) else if "%answer%"=="n" ( 
	set suffix=""
)else (
	echo "質問通りに答えろよ y or n"
	goto label_error
)


if "%PROCESSOR_ARCHITECTURE%" == "x86" (

	echo "32bit用のインストールを行います"
	unzip.exe -o -d %INSTALLDIR% 32bit%suffix%.zip 32bit%suffix%\*

) else (

	echo "64bit用のインストールを行います"
	unzip.exe -o -d %INSTALLDIR% 64bit%suffix%.zip 64bit%suffix%\*

)

call :cleanall %INSTALLDIR%\dotfiles

unzip.exe -o -d %INSTALLDIR% dotfiles.zip

if "%answer%"=="y" (
	call %INSTALLDIR%\dotfiles\dts\install.bat
	rm -rf %INSTALLDIR%\lib\nvim\bin\win32yank.exe
	ren %INSTALLDIR%\lib\nvim\bin\win32yank_v0.0.1.exe %INSTALLDIR%\lib\nvim\bin\win32yank.exe
)else (
	call %INSTALLDIR%\dotfiles\_setenv.bat
	del %INSTALLDIR%\lib\nvim\bin\win32yank_v0.0.1.exe
)

mkdir tmp

unzip.exe -d tmp pip.zip pip\*

cd tmp

call install.bat

cd ..
rm.exe -rf tmp

REM ファイル・フォルダ存在チェック
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


REM 存在したら削除
:cleanall
IF EXIST %1 rm.exe -rf %1

REM ファイル・フォルダ判定
:checkdir
IF NOT EXIST %1\ (
	echo これフォルダじゃねーし
	goto label_error
)

REM エラー処理
:label_error
echo という訳で中止する
goto label_end

REM 終了処理
:label_end
pause
exit

