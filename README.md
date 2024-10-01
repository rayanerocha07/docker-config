# How to Run the Project

This is a minimum template for setting up a project with authentication with Rails, PostgreSQL, React, and Docker in the development environment.

Clone the repository:

```bash

git clone git@github.com:rayanerocha07/docker-config.git
cd docker-config
````

## Instructions

1. **Build the Docker containers**:
    ```bash
    docker compose build      # Installs dependencies needed to start
    ```

2. **Start the server**:
    ```bash
    docker compose up         # Launches the application
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
    bundle exec rails test    # Executes the test suite
    ```

6. **Stop the server**: Use `CTRL + C` to stop the server.

7. **Shut down the containers**:
    ```bash
    docker compose down       # Stops and removes the containers
    ```

## Ports

- **Backend**: [http://localhost:3000](http://localhost:3000)
- **Frontend**: [http://localhost:3001](http://localhost:3001)


Make sure you have Docker and Docker Compose installed on your machine before running these commands.
