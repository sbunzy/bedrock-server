FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y unzip curl libcurl4 libssl1.0.0
RUN curl https://minecraft.azureedge.net/bin-linux/bedrock-server-1.7.0.13.zip --output bedrock-server.zip
RUN unzip bedrock-server.zip -d bedrock-server
RUN rm bedrock-server.zip

RUN mkdir /bedrock-server/config 
RUN mv /bedrock-server/server.properties /bedrock-server/config 
RUN touch /bedrock-server/config/whitelist.json 
RUN touch /bedrock-server/config/permissions.json 
#RUN mv /bedrock-server/permissions.json /bedrock-server/config 
#RUN mv /bedrock-server/whitelist.json /bedrock-server/config 
RUN ln -s /bedrock-server/config/server.properties /bedrock-server/server.properties 
RUN ln -s /bedrock-server/config/permissions.json /bedrock-server/permissions.json 
RUN ln -s /bedrock-server/config/whitelist.json /bedrock-server/whitelist.json
    
EXPOSE 19132/udp

VOLUME /bedrock-server/worlds /bedrock-server/config

WORKDIR /bedrock-server
ENV LD_LIBRARY_PATH=.
CMD ./bedrock_server
