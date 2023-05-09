FROM ubuntu:latest


RUN apt-get update && apt-get -y install curl sendmail
RUN apt-get update && apt-get -y install coreutils

COPY myscript.sh /usr/local/bin/myscript.sh
RUN chmod +x /usr/local/bin/myscript.sh

CMD ["bash", "-c", "while true; do /usr/local/bin/myscript.sh; sleep 30; done"]
