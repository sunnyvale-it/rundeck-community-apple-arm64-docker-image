FROM ubuntu:20.04 

ARG RUNDECK_VERSION=3.4.8
ARG RUNDECK_BUILD=20211214-1

ENV JAVA_XMX=1024m
ENV JAVA_XMS=512m
ENV JAVA_OPTS="-Djava.security.egd=file:/dev/./urandom"

ENV RUNDECK_VERSION=${RUNDECK_VERSION}
ENV RUNDECK_BUILD=${RUNDECK_BUILD}
ENV RUNDECK_PORT=4440

RUN mkdir /home/rundeck && \
    useradd -m -d /home/rundeck rundeck

WORKDIR /home/rundeck


RUN add-apt-repository ppa:deadsnakes/ppa
RUN curl -sL https://packages.rundeck.com/pagerduty/rundeck/gpgkey | apt-key add -
RUN echo "deb https://packages.rundeck.com/pagerduty/rundeck/any/ any main" | tee -a /etc/apt/sources.list.d/rundeck.list
RUN echo "deb-src https://packages.rundeck.com/pagerduty/rundeck/any/ any main" | tee -a /etc/apt/sources.list.d/rundeck.list
RUN apt-get update
RUN apt-get install -y curl gnupg
RUN apt-get install -y openjdk-11-jre-headless
RUN apt-get install -y rundeck=${RUNDECK_VERSION}.${RUNDECK_BUILD}
RUN apt-get install -y python3
RUN apt-get install -y python3-pip

COPY ./scripts/run.sh .
RUN chmod 755 run.sh

VOLUME [/home/rundeck/server/data]

EXPOSE 4440/tcp

RUN chown -R rundeck:rundeck /home/rundeck

USER rundeck

ENTRYPOINT ["/home/rundeck/run.sh"]

