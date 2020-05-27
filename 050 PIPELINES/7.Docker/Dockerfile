FROM ubuntu
MAINTAINER cesar niyo <cesar@gmail.com>
RUN apt-get update
CMD ["echo", "Hello World...!from my first docker image"]

FROM python:3

ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
COPY . /code/
RUN pip install -r requirements.txt

