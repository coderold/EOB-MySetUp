@echo off
call config.bat

if "%1"=="start" goto start
if "%1"=="backend" goto backend
if "%1"=="db" goto db
if "%1"=="unity" goto unity
if "%1"=="stop" goto stop
if "%1"=="shutdown" goto shutdown
goto help

:start
echo Starting full dev environment...
start "" "%DOCKER_PATH%"
timeout /t 10
cd /d "%REPO_PATH%"
docker compose up -d db
start "" "%GIT_BASH_PATH%" --cd="%REPO_PATH%"
start "" "%VSCODE_PATH%" "%REPO_PATH%"
start "" "%UNITY_PATH%" -projectPath "%UNITY_PROJECT%"
start cmd /k "cd /d %BACKEND_PATH% && dotnet watch run"
goto end

:backend
echo Starting backend...
start cmd /k "cd /d %BACKEND_PATH% && dotnet watch run"
goto end

:db
echo Starting database...
cd /d "%REPO_PATH%"
docker compose up -d db
goto end

:unity
echo Opening Unity...
start "" "%UNITY_PATH%" -projectPath "%UNITY_PROJECT%"
goto end

:stop
echo Stopping containers...
cd /d "%REPO_PATH%"
docker compose down
goto end

:shutdown
echo Shutting down development environment...

REM Stop docker containers
cd /d "%REPO_PATH%"
docker compose down

REM Stop backend processes
taskkill /F /IM dotnet.exe >nul 2>&1

REM Close Unity
taskkill /F /IM Unity.exe >nul 2>&1

REM Close VS Code
taskkill /F /IM Code.exe >nul 2>&1

echo Environment stopped.
goto end

:help
echo Commands:
echo dev start      - start everything
echo dev backend    - start backend
echo dev db         - start database
echo dev unity      - open unity
echo dev stop       - stop docker
echo dev shutdown   - close all development tools
goto end

:end
pause