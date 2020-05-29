
set WDIR=%TEMP%\pythonsrc
set VERSION=%1

if "%VERSION%" == "" (
  echo "引数がありません。アップデートしたいバージョンを指定してください。"
  echo "例: pythonupgrade.bat 3.7.5"
  pause
  exit /b 1
)

set VNUM=%VERSION:.=%

rd /s /q %WDIR%
mkdir %WDIR%
cd %WDIR%
C:

set PYTHONORG=https://www.python.org/ftp/python/%VERSION%/amd64
set MYREPO=https://raw.githubusercontent.com/kirin123kirin/cmd/master
set MYDOTFILE=https://raw.githubusercontent.com/kirin123kirin/dotfile/master/python
set WGETCMD=wget --no-check-certificate

%WGETCMD% %PYTHONORG%/core.msi
%WGETCMD% %PYTHONORG%/dev.msi
%WGETCMD% %PYTHONORG%/doc.msi
%WGETCMD% %PYTHONORG%/exe.msi
%WGETCMD% %PYTHONORG%/launcher.msi
%WGETCMD% %PYTHONORG%/lib.msi
%WGETCMD% %PYTHONORG%/path.msi
%WGETCMD% %PYTHONORG%/test.msi
%WGETCMD% %PYTHONORG%/pip.msi
%WGETCMD% %PYTHONORG%/tcltk.msi
%WGETCMD% %PYTHONORG%/tools.msi
%WGETCMD% %PYTHONORG%/ucrt.msi

mkdir %WDIR%\python
msiexec /a core.msi targetdir=%WDIR%\python /qn
msiexec /a dev.msi targetdir=%WDIR%\python /qn
msiexec /a doc.msi targetdir=%WDIR%\python /qn
msiexec /a exe.msi targetdir=%WDIR%\python /qn
msiexec /a launcher.msi targetdir=%WDIR%\python /qn
msiexec /a lib.msi targetdir=%WDIR%\python /qn
msiexec /a path.msi targetdir=%WDIR%\python /qn
msiexec /a test.msi targetdir=%WDIR%\python /qn
msiexec /a pip.msi targetdir=%WDIR%\python /qn
msiexec /a tcltk.msi targetdir=%WDIR%\python /qn
msiexec /a tools.msi targetdir=%WDIR%\python /qn
msiexec /a ucrt.msi targetdir=%WDIR%\python /qn

del python\*.msi
del *.msi
del python\py.exe
del python\pyw.exe
del python\pyshellext*.dll
del python\NEWS.txt

rem %ProgramFiles%\api-ms-win-*.dll
move python\api-*.dll python\DLLs\
move python\ucrtbase.dll python\DLLs\

set PYTHONPATH=Y:\usr\local\python

%WGETCMD% %MYDOTFILE%/python37.pth -O python\python%VNUM:~,2%.pth
copy Y:\usr\local\python\Lib\site-packages\custompy.pth python\Lib\site-packages\
rd /s /q Y:\usr\local\python
move python Y:\usr\local\
y:
cd %PYTHONPATH%

%WGETCMD% https://raw.githubusercontent.com/pypa/get-pip/master/get-pip.py
.\python.exe get-pip.py
del get-pip.py

%WGETCMD% %MYDOTFILE%/repair_scripts.py
rem %WGETCMD% %MYDOTFILE%/install.bat

python repair_scripts.py
del repair_scripts.py

cd ..
7z.exe a python%VNUM%.zip python

%WGETCMD% %MYDOTFILE%/requirements.txt -qO - | grep -v "^#" | grep -v "spyder" | grep -v "jedi" | grep -v "pyqt5" > python\requirement.txt
pip install -r python\requirement.txt
pip install spyder

rem pip install -r %MYDOTFILE%/requirements.txt
pip install -r %MYDOTFILE%/requirements_win.txt

7z.exe a python%VNUM%_full.zip python

