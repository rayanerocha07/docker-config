## How to Run the Project 

This repository provides a minimal template for setting up a project with Rails, PostgreSQL, React, and Docker in the development environment. It includes basic authentication to help you get started quickly.


## Prerequisites

Ensure the following tools are installed on your machine:

- Docker (https://www.docker.com)
- Docker Compose (https://docs.docker.com/compose)

## Getting Started

Follow these steps to set up and run the project locally.

### Clone the Repository

```bash

git clone git@github.com:rayanerocha07/docker-config.git
cd docker-config
````

## Setup and running instructions

1. **Build the Docker containers**:
    ```bash
    docker compose build # Installs dependencies needed to start
    ```

2. **Start the application**:
    ```bash
    docker compose up # Launches the application
    ```

3. **Access the backend container**:

    ```bash
    docker compose run backend bash # Opens a shell in the backend container
    ```

4. **Access the frontend container**:
    ```bash
    docker compose run frontend bash # Opens a shell in the backend container
    ```

5. **Run tests**:
    ```bash
    bundle exec rails test # Executes the test suite
    ```

6. **Stop the server**: 
Press `CTRL + C` in the terminal to stop the running server.

7. **Shutdown and Clean Up (stop and remove all containers)**:
    ```bash
    docker compose down # Stops and removes the containers
    ```

## Ports

- **Backend**: [http://localhost:3000](http://localhost:3000)
- **Frontend**: [http://localhost:3001](http://localhost:3001)
