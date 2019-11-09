@echo off
cd %~dp0

setx PYTHONPATH %CD%
setx Path %Path%;%PYTHONPATH%

%CD%\python.exe %CD%\repare_scripts.py %CD%\Scripts

cd ..
echo %CD%\bin > %CD%\python\Lib\site-packages\custompy.pth

pause
