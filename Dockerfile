FROM openjdk:8-jre

RUN apt-get update && \
    apt-get -y install openssh-client

RUN curl --create-dirs -o /bin/embulk -L "https://dl.embulk.org/embulk-0.9.23.jar" && \
    chmod +x /bin/embulk

RUN mkdir -p /your_embulk_bundle_dir
WORKDIR /your_embulk_bundle_dir

COPY Gemfile .
COPY Gemfile.lock .

RUN embulk bundle install --path vendor/bundle