FROM ubuntu:22.04

# Source: https://github.com/thomasvvugt/whisperx/blob/96762fac321cb1de189929ccb8f43a9deaf67cb6/Dockerfile.cpu

RUN apt-get update -y && \
  apt-get install -y git ffmpeg software-properties-common && \
  add-apt-repository -y ppa:deadsnakes/ppa && \
  apt-get install -y python3.10 python3-pip && \
  pip3 install setuptools-rust && \
  pip3 install torch==2.1.2 torchvision==0.16.2 torchaudio==2.1.2 --index-url https://download.pytorch.org/whl/cpu && \
  pip3 install git+https://github.com/m-bain/whisperx.git && \
  git clone https://github.com/m-bain/whisperX.git /whisperx && \
  pip3 install -e /whisperx &&\
  mkdir /app && \
  cd /app && \
  rm -rf /var/lib/apt/lists/*

WORKDIR /app

ENTRYPOINT ["/usr/local/bin/whisperx"]
