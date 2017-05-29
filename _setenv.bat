cd %~dp0

set APPROOT=%CD%

set GITHOME=%APPROOT%\usr\lib\msysgit
set NODE_PATH=%APPROOT%\usr\lib\node_modules
set PYTHONPATH=%APPROOT%\usr\lib\python3
set VIM=%APPROOT%\dotfiles
set VIMRUNTIME=%APPROOT%\usr\lib\gvim\vim80
set CACHE=%APPROOT%\.cache

setx APPROOT %APPROOT%

setx GITHOME %GITHOME%
setx NODE_PATH %NODE_PATH%
setx PYTHONPATH %PYTHONPATH%
setx VIM %VIM%
setx VIMRUNTIME %VIMRUNTIME%
setx CACHE %CACHE%

setx XDG_CONFIG_HOME %APPROOT%\dotfiles\vimfiles
setx XDG_CACHE_HOME %CACHE%
setx XDG_RUNTIME_DIR %APPROOT%\tmp

setx Path "%APPROOT%;%APPROOT%\bin;%APPROOT%\cmd;%APPROOT%\usr\bin;%GITHOME%;%GITHOME%\bin;%GITHOME%\cmd;%GITHOME%\usr\bin;%PYTHONPATH%;%PYTHONPATH%\Scripts;%VIMRUNTIME%;%NODE_PATH%\bin"

echo source %APPROOT%\dotfiles\vimrc > %USERPROFILE%\_vimrc
rem echo execute 'source' fnamemodify(expand($APPROOT), ':h').'/dotfiles/vimrc' > %USERPROFILE%\_vimrc