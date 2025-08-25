@echo off
setlocal

set "url=https://raw.githubusercontent.com/CanvasDeno/VectorXone/refs/heads/main/editor.html"
set "filename=VectorXone.html"
set "outpath=%CD%\%filename%"

echo Downloading VectorXone...
powershell -Command "Invoke-WebRequest -Uri '%url%' -OutFile '%outpath%'"

echo.
echo File downloaded to: %outpath%
set /p choice=Do you want to install VectorXone in your computer? (Y/N): 

if /I "%choice%"=="Y" (
    echo Installing VectorXone...
    set "installpath=%USERPROFILE%\TretroBox\Modules"
    if not exist "%installpath%" (
        mkdir "%installpath%"
    )
    copy "%outpath%" "%installpath%" >nul
    echo Installed to %installpath%
    echo Open the file in a web browser to use it.
) else (
    echo Installation cancelled. File remains in current directory.
)

endlocal
