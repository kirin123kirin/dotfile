cd %~dp0

set APPROOT=%CD%

set CONDAPATH=%APPROOT%\usr\share\conda
set NODE_PATH=%APPROOT%\usr\share\node_modules
set PYTHONPATH=%CONDAPATH%
set VIMRUNTIME=%APPROOT%\usr\share\nvim\runtime
set CACHE=%APPROOT%\dotfiles\.cache

setx APPROOT %APPROOT%
setx CONDAPATH %CONDAPATH%
setx NODE_PATH %NODE_PATH%
setx PYTHONPATH %PYTHONPATH%
setx VIMRUNTIME %VIMRUNTIME%
setx VIM %VIMRUNTIME%
setx CACHE %CACHE%

setx XDG_CONFIG_HOME %APPROOT%\dotfiles\.config
setx XDG_CACHE_HOME %CACHE%
setx XDG_RUNTIME_DIR %Temp%
setx XDG_DATA_HOME ""

setx Path "%APPROOT%;%APPROOT%\bin;%APPROOT%\cmd;%APPROOT%\usr\bin;%APPROOT%\mingw32\bin;%PYTHONPATH%;%PYTHONPATH%\Scripts;%VIMRUNTIME%;%NODE_PATH%\bin"



