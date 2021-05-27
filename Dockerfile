FROM ubuntu:latest

RUN apt update && apt install -y curl file git unzip xz-utils zip

RUN useradd -ms /bin/bash user

USER user

WORKDIR /home/user

RUN git clone -b beta https://github.com/flutter/flutter.git

ENV PATH "$PATH:/home/user/flutter/bin"

RUN flutter doctor && flutter precache --web
