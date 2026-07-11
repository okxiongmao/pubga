@echo off
net session >nul 2>&1 || (echo 请以管理员身份运行！ & pause & exit)

:: 定义下载地址 (直接填入你域名对应的 GitHub Raw 地址)
set "BASE_URL=https://down.kookle.top"
set "APO_URL=https://cytranet-dal.dl.sourceforge.net/project/equalizerapo/1.4.2/EqualizerAPO-x64-1.4.2.exe?viasf=1&fid=065c83d53c6d64a8&e=1783846200&st=dkIWmzAXzoiCORNv1Xn7qg"

echo 正在从云端获取配置...

:: 下载插件
bitsadmin /transfer "DownloadPlugin" %BASE_URL%/rnnoise_mono.dll "%TEMP%\rnnoise_mono.dll"

:: 下载 APO
bitsadmin /transfer "DownloadAPO" %APO_URL% "%TEMP%\APO_Setup.exe"

:: 安装与部署
start /wait %TEMP%\APO_Setup.exe /S
mkdir "C:\Program Files\EqualizerAPO\VSTPlugins" 2>nul
copy /Y "%TEMP%\rnnoise_mono.dll" "C:\Program Files\EqualizerAPO\VSTPlugins\"

:: 写入配置 (Device: * 确保不挑麦克风)
echo Device: * > "C:\Program Files\EqualizerAPO\config\config.txt"
echo VST: C:\Program Files\EqualizerAPO\VSTPlugins\rnnoise_mono.dll >> "C:\Program Files\EqualizerAPO\config\config.txt"

echo 部署完成！
pause