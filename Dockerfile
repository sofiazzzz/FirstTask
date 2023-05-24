FROM ubuntu:latest


RUN apt-get update && apt-get -y install curl sendmail
RUN apt-get update && apt-get -y install coreutils

COPY myscript.sh /usr/local/bin/myscript.sh
RUN chmod +x /usr/local/bin/myscript.sh

RUN ./usr/local/bin/myscript.sh
