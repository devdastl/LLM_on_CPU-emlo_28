FROM ubuntu:18.04

RUN apt-get update && apt-get install build-essential git wget -y

WORKDIR /app
RUN git clone https://github.com/ggerganov/llama.cpp && cd llama.cpp && make -j
WORKDIR /app/llama.cpp

