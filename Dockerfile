FROM python:3.7
_
RUN mkdir /scripts
WORKDIR /scripts
ADD scripts /scripts/

