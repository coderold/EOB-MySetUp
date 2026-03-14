@echo off
echo Starting Echoes of Bathala Dev Environment...

REM ====== SET REPO PATH ======
set REPO_PATH=C:\Users\User\Documents\EchoesOfBathala\Echoes-Of-Bathala

REM 1. Open Docker Desktop (optional if already running)
start "" "C:\Program Files\Docker\Docker\Docker Desktop.exe"

REM Wait 10 seconds for Docker to initialize
timeout /t 10

REM 2. Start Docker services
cd /d %REPO_PATH%
docker compose up -d db

REM 3. Open Git Bash in repo folder
start "" "C:\Program Files\Git\git-bash.exe" --cd="%REPO_PATH%"

REM 4. Start .NET backend in new terminal
start cmd /k "cd /d %REPO_PATH%\backend\src\GameBackend.API && dotnet watch run"

REM 5. Open Unity Project
start "" "D:\Unity\Installs\6000.0.60f1\Editor\Unity.exe" -projectPath "%REPO_PATH%\unity\Echoes-Of-Bathala"

REM 6. Open VS Code in repo
start "" "C:\Users\User\AppData\Local\Programs\Microsoft VS Code\Code.exe" "%REPO_PATH%"

echo Tapos na boss matthew!
pause