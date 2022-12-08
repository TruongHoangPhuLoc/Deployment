FROM ubuntu 
RUN apt update 
RUN apt-get install apache2 -y
RUN apt-get install apache2-utils -y 
EXPOSE 80