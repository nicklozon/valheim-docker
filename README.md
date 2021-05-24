# Getting Started
## OUTDATED
1. Build the image: `docker build -t valheim .`
1. Create the container `docker create -v "$(pwd)/worlds":/valheim/worlds -p 2456-2458:2456-2458/udp --name dritz_server valheim`
1. Start the container `docker start dritz_server`

## UPDATED
`docker-compose up`

### Multiple Servers
`docker-compose --env-file .env.solo up`