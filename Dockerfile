FROM ubuntu:15.04

MAINTAINER Emmet O'Grady <emmet@nimbleci.com>

RUN apt-get update && apt-get install -y \
        php5-cli

ADD . /code/
RUN chmod +x /code/entrypoint.sh

ENTRYPOINT ["/code/entrypoint.sh"]

