FROM ubuntu:20.04

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV DEBIAN_FRONTEND noninteractive

RUN cd /root && mkdir /root/.ssh/

RUN apt update
RUN apt install -y iputils-ping vim tree curl git make python ansible

RUN cd /root && git clone https://github.com/ScaleComputing/HyperCoreAnsibleCollection.git

RUN cd /root/HyperCoreAnsibleCollection && ansible-galaxy collection install community.general
RUN cd /root/HyperCoreAnsibleCollection && ansible-galaxy collection install scale_computing.hypercore

WORKDIR /root/HyperCoreAnsibleCollection

ENTRYPOINT [ "/bin/bash" ]