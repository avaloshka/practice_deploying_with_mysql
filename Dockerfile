FROM ubuntu:bionic
ARG DEBIAN_FRONTEND=noninteractive
RUN sudo apt-get -y install python 3.10
RUN apt-get update && apt-get -y install \
    && python3.10 python3.10-dev python3-pip python3-venv python3-wheel \
    && mysql-client libsqlclient-dev libssl-dev default-libmysqlclient-dev


RUN python -m pip install urllib3
RUN sudo python -m pip install urllib3

ARG USER=root
USER $USER
RUN python3 -m venv venv
WORKDIR /app
COPY requirements.txt requirements.txt
RUN /venv/bin/pip install -r requirements.txt

COPY . .
EXPOSE 5000
RUN chmod +x /app/start.sh
ENTRYPOINT ["./start.sh"]
