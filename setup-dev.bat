@echo off
echo Starting Echoes of Bathala Dev Environment...

REM Load config
call config.bat

REM 1. Open Docker Desktop
start "" "%DOCKER_PATH%"

timeout /t 10

REM 2. Start database
cd /d "%REPO_PATH%"
docker compose up -d db

REM 3. Open Git Bash in repo
start "" "%GIT_BASH_PATH%" --cd="%REPO_PATH%"

REM 4. Run backend
start cmd /k "cd /d %REPO_PATH%\backend\src\GameBackend.API && dotnet watch run"

REM 5. Open Unity
start "" "%UNITY_PATH%" -projectPath "%UNITY_PROJECT%"

REM 6. Open VS Code
start "" "%VSCODE_PATH%" "%REPO_PATH%"

echo Environment Ready!
pause