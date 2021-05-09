# Getting Started
1. Build the image: `docker build -t valheim .`
1. Create the container `docker create -p 2456-2458:2456-2458/udp --name dritz_server valheim`
1. Start the container `docker start dritz_server`