FROM ubuntu:latest

RUN apt-get update && apt-get upgrade
RUN apt-get install -y gcc libffi-dev python3-dev libc-dev gcc python3-pip 

COPY ./requirements.txt /app/requirements.txt

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

WORKDIR /app

COPY . /app

EXPOSE 8080

RUN  pip3 install -r /app/requirements.txt 
RUN rm -rf /tmp 
CMD ["flask", "run", "-h", "0.0.0.0", "-p", "8080" ]

