FROM debian:stretch

MAINTAINER David Scott <dave@recoil.org>

RUN apt-get -y update
RUN apt-get install -y openjdk-8-jre-headless wget
# 1.14.2
RUN wget -q https://launcher.mojang.com/v1/objects/808be3869e2ca6b62378f9f4b33c946621620019/server.jar

# Sets working directory for the CMD instruction (also works for RUN, ENTRYPOINT commands)
# Create mount point, and mark it as holding externally mounted volume
WORKDIR /data
VOLUME /data

# Expose the container's network port: 25565 during runtime.
EXPOSE 25565

#Automatically accept Minecraft EULA, and start Minecraft server
CMD echo eula=true > /data/eula.txt && java -Xmx1536M -jar /server.jar nogui

