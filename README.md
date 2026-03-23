# Echoes of Bathala Development Environment Script

This project includes a development script that helps start the local development environment quickly.

Instead of manually opening multiple programs and running commands every time, the script automates the setup.

## What the Script Does

The script automatically:

* Starts Docker Desktop
* Runs the database container using Docker Compose
* Opens Git Bash inside the repository
* Starts the backend server using `dotnet watch run`
* Opens the Unity project
* Opens the repository in Visual Studio Code

This allows developers to start working with a single command.

---

# Commands

`dev start` - Starts the full development environment including Docker, database container, backend server, Git Bash, Unity project, and VS Code.

`dev backend` - Starts only the backend server using `dotnet watch run`.

`dev db` - Starts the database, redis pubsub, redis buffer container using Docker Compose.

`dev unity` - Opens the Unity project.

`dev code` - Open Unity project folder on VS Code.

`dev git` - Open Git Bash directly at the repo directory.

`dev stop` - Stops all Docker containers used by the project.

`dev shutdown` - Close all development tools.

---

### Notes to myself

Before starting the backend you need to load the env with Git Bash.
`./setup-dev.sh`.