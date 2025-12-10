@echo off

REM --- Percorso della cartella in cui si trova questo .bat ---
set "BASE=%~dp0"

REM --- Controllo se è stato trascinato un file ---
if "%~1"=="" (
    echo Trascina un file video sopra questo .bat
    pause
    exit /b
)

set "INPUT=%~1"
set "BASENAME=%~n1"


REM --- Conversione in HLS ---
ffmpeg -i "%INPUT%" -c:v libx264 -c:a aac -hls_time 10 -hls_list_size 0 -threads 5 -preset ultrafast -f hls "video.m3u8"

echo.
echo Conversione completata!
pause
