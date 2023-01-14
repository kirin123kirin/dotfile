@echo off
powershell -ExecutionPolicy RemoteSigned -File "%IDEROOT%\usr\bin\getlatest.ps1" %*
