set PROXYADDR http://proxy.example.com:8080
set MAILADDR kirin123kirin@gmail.com

git config --global http.proxy %PROXYADDR%
git config --global https.proxy %PROXYADDR%
git config --global user.email %MAILADDR%
git config --global color.ui auto

echo "[global]" > %APPDATA%\pip\pip.ini
echo "proxy = %PROXYADDR%" >> %APPDATA%\pip\pip.ini

