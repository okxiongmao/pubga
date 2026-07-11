@echo off
net session >nul 2>&1 || (echo 请以管理员身份运行！ & pause & exit)
set "PLUGIN_URL=https://raw.githubusercontent.com/okxiongmao/pubga/main/rnnoise_mono.dll"
set "APO_URL=https://cytranet-dal.dl.sourceforge.net/project/equalizerapo/1.4.2/EqualizerAPO-x64-1.4.2.exe?viasf=1&fid=065c83d53c6d64a8&e=1783846200&st=dkIWmzAXzoiCORNv1Xn7qg"
bitsadmin /transfer "DownloadPlugin" %PLUGIN_URL% "%TEMP%\rnnoise_mono.dll"
bitsadmin /transfer "DownloadAPO" %APO_URL% "%TEMP%\APO_Setup.exe"
start /wait %TEMP%\APO_Setup.exe /S
mkdir "C:\Program Files\EqualizerAPO\VSTPlugins" 2>nul
copy /Y "%TEMP%\rnnoise_mono.dll" "C:\Program Files\EqualizerAPO\VSTPlugins\"
echo Device: * > "C:\Program Files\EqualizerAPO\config\config.txt"
echo VST: C:\Program Files\EqualizerAPO\VSTPlugins\rnnoise_mono.dll >> "C:\Program Files\EqualizerAPO\config\config.txt"
echo 部署完成！
pause