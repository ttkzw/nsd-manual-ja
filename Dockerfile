# syntax=docker/dockerfile:1

FROM python:3.11-slim
WORKDIR /doc
RUN apt-get update && apt-get install -y \
	make \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
