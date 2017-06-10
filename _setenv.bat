cd %~dp0
cd ..

set APPROOT=%CD%

set PYTHONPATH=%APPROOT%\lib\python3
set VIMVERSION=nvim
set VIM=%APPROOT%\dotfiles\%VIMVERSION%
set VIMHOME=%APPROOT%\lib\%VIMVERSION%
set VIMRUNTIME=%VIMHOME%\share\%VIMVERSION%\runtime
set CACHE=%APPROOT%\libexec

setx APPROOT %APPROOT%

setx PYTHONPATH %PYTHONPATH%
rem setx VIM %VIM%
setx VIMRUNTIME %VIMRUNTIME%
rem setx CACHE %CACHE%

setx XDG_CONFIG_HOME %APPROOT%\dotfiles
setx XDG_CACHE_HOME %CACHE%
setx XDG_RUNTIME_DIR %APPROOT%\tmp

setx Path "%APPROOT%;%APPROOT%\bin;%APPROOT%\usr\bin;%PYTHONPATH%;%PYTHONPATH%\Scripts;%VIMHOME%\bin;%VIMRUNTIME%"

git config --global core.editor "'C:\Program Files (x86)\TeraPad\TeraPad.exe' //cu8"

rem echo source %APPROOT%\dotfiles\vimrc > %USERPROFILE%\_vimrc