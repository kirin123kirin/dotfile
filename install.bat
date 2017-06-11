@echo off

set INSTALLDIR=Y:\home

set /P INSTALLDIR="�C���X�g�[����t���p�X����͂��Ă�������[%INSTALLDIR%]: "

call :exists %INSTALLDIR%

set answer="y"
set /p answer="DTS�N���C�A���g�ւ̃C���X�g�[���ł���(Y/n)�H: "
if %answer%=="Y" set anser="y"
if "%answer%"=="y" (
	set suffix="_min"
) else if "%answer%"=="n" ( 
	set suffix=""
)else (
	echo "����ʂ�ɓ������ y or n"
	goto label_error
)


if "%PROCESSOR_ARCHITECTURE%" == "x86" (

	echo "32bit�p�̃C���X�g�[�����s���܂�"
	unzip.exe -o -d %INSTALLDIR% 32bit%suffix%.zip 32bit%suffix%\*

) else (

	echo "64bit�p�̃C���X�g�[�����s���܂�"
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

REM �t�@�C���E�t�H���_���݃`�F�b�N
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


REM ���݂�����폜
:cleanall
IF EXIST %1 rm.exe -rf %1

REM �t�@�C���E�t�H���_����
:checkdir
IF NOT EXIST %1\ (
	echo ����t�H���_����ˁ[��
	goto label_error
)

REM �G���[����
:label_error
echo �Ƃ�����Œ��~����
goto label_end

REM �I������
:label_end
pause
exit

