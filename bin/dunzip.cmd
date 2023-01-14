@echo off
powershell -ExecutionPolicy RemoteSigned -File "%IDEROOT%\usr\bin\dunzip.ps1" %*
