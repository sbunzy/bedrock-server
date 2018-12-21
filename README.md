# minecraft-bedrock
Run a bedrock server in a Docker container

This Dockerfile will download the Bedrock Server app and set it up, along with its dependencies.


Docker-compose:
  
    image: bunzy/minecraft-bedrock-server
    container_name: bedrock
    restart: always
    ports:
      - 19132:19132/udp
    volumes:
      - /home/docker/bedrock/worlds:/bedrock-server/worlds
      - /home/docker/bedrock/config:/bedrock-server/config



