# DevOps coding challenge solution

## To Containerise the development environment

### Start by creating a Dockerfile for the backend

1. Use Python as the base image and install the required dependencies.
   ⚠️ **NOTE**: According to our requirements, ensure that the database username is tech_user.
2. Open the terminal and navigate to the directory containing the Dockerfile. Run the following command to build the Docker image:
   ```
   docker build . -t backend
   ```

### Containerizing the frontend

1. Use the suitable base image for the frontend framework and install the required dependencies
2. Open the terminal and navigate to the directory containing the Dockerfile. Run the following command to build the Docker image:
   ```
   cd client
   docker build . -t client
   ```

## Writing the docker-compose file

This Docker Compose configuration sets up a multi-service environment for running a web application composed of a frontend, backend, PostgreSQL database, and Caddy server. Open the terminal and the run the following command:

```
    docker-compose -f docker-compose.yml up -d
```

To access your website on your local machine, please visit

```
    https://localhost/client/#/
```

## Adding a reverse proxy container with SSL support

1. Reverse proxy with SSL support using a Caddyfile. The Caddyfile specifies the configuration for Caddy to act as a reverse proxy with SSL support.
2. TLS Configuration: We specify TLS configuration for the localhost domain using the SSL certificate (localhost.crt) and key (localhost.key) located in the /data directory. Additionally, we specify the root certificate authority (CA) using rootCA.crt.
3. Reverse Proxy Configuration: Requests to paths starting with /api/_ are reverse proxied to the backend API server running on port 3000 (backend:3000). Similarly, requests to paths starting with /client/_ are reverse proxied to the client service (client).
4. To run Caddy with this configuration, you can use Docker Compose or any other method to start a Caddy container and mount the Caddyfile along with the SSL certificates.

## Implementing Hot code reloading

To achieve hot code reloading, the `--reload` option is passed to Uvicorn in the command section of the service configuration along with docker's volume mapping.

Vite's dev server (npm run dev ) automatically detects changes to our client files and applies them without reloading the entire page along with docker's volume mapping.

## Continuous integration

Open the gitlab-ci.yml file to review its contents.
Import the project to GitLab
To run the pipeline, GitLab will automatically trigger it when you push changes to your repository.
You can also manually trigger the pipeline from the GitLab interface.

## Kubernetes

Install minikube through this link https://minikube.sigs.k8s.io/docs/start/

```
minikube start
minikube kubectl -- get po -A
minikube dashboard
```

Start by creating separate files to deploy the full stack (with TLS) in a Kubernetes cluster. Then run the following command:

```
cd kubernetes
minikube kubectl -- apply -f database.yml
minikube kubectl -- apply -f proxy.yml
minikube kubectl -- apply -f server.yml
minikube kubectl -- apply -f client.yml

```

Visit your kuberenetes dashboard where you can all these pods running.
