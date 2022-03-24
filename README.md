# Blue/Green Example

Work out blue/green deployment configuration for single DigitalOcrean droplet.

## Prerequisites

  - Docker
  - docker-compose
  - Python 3
  - Pip
  - Vue CLI

## Environment Variables

Make sure you have defined enviornment variables for:
  - APP_USER - username on DigitalOcran droplet, "root"
  - APP_HOST - IP address of DigitalOcean droplet
  - APP_SSHKEY - location of your private key for DigitalOcean
  - APP_WORKDIR - current local working directory for your project

The easiest way to do this is to have an `.env` file in the root of the
project and then source it (`source .env`) whenver you enter the project.

## Initial Deploy

First, create a droplet, and setting up SSH keys for it. Then run
`push-all.bash` to push code to the server. Then run `start-up.bash` with an
argument of either `blue` or `green` to point NGINX to one process or another.
Now NGINX should be directing traffic from port 8000 to the port that your
preferred server, either blue or green, is listening on; either 8001 or 8002,
respectively.

```bash
./scripts/remote/push-all.bash
./scripts/remote/start-up.bash blue
```

## Toggle Between Blue and Green

First, update your local project, and the server, with the new code for the
green server. Then send a command to the droplet to restart/rebuild the NGINX
image with the green config file; switching the traffic from the blue server
process to the green server process.

```bash
./scripts/remote/update-server.bash green
./scripte/remote/toggle-server.bash green
```