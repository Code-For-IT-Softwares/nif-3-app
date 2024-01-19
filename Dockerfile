FROM ubuntu:latest

RUN apt-get update

RUN apt-get install -y git
RUN apt-get install -y unzip
RUN apt-get install -y curl 
RUN apt-get install -y python3 
#install psmisc for bash file fuser
RUN apt-get install -y psmisc  

RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter

ENV PATH="${PATH}:/usr/local/flutter/bin"

RUN flutter doctor

RUN flutter config --enable-web

RUN mkdir /app

COPY . /app

WORKDIR /app

RUN flutter build web

EXPOSE 5050

RUN chmod +x server/web_server.sh

CMD [ "server/web_server.sh" ]