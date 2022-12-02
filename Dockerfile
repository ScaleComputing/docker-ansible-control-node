FROM ubuntu:18.04

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV DEBIAN_FRONTEND noninteractive

RUN cd /root && mkdir /root/.ssh/

RUN apt update
RUN apt install -y software-properties-common
# RUN apt-add-repository --yes --update ppa:ansible/ansible
RUN add-apt-repository ppa:deadsnakes/ppa

RUN apt install -y iputils-ping vim tree curl git make
RUN apt install -y python3.10
RUN apt install -y python3.10-dev python3.10-venv

RUN cd /root && python3.10 -m venv .venv
RUN echo "source .venv/bin/activate" >> /root/.bashrc
#RUN . /root/.venv/bin/activate
RUN . /root/.venv/bin/activate && pip install --upgrade pip
RUN . /root/.venv/bin/activate && pip install ansible-core

RUN cd /root && git clone https://github.com/ScaleComputing/HyperCoreAnsibleCollection.git

RUN . /root/.venv/bin/activate && cd /root/HyperCoreAnsibleCollection && ansible-galaxy collection install community.general
RUN . /root/.venv/bin/activate && cd /root/HyperCoreAnsibleCollection && ansible-galaxy collection install scale_computing.hypercore

ENV SC_USERNAME admin
ENV SC_PASSWORD <PASSWORD>
ENV SC_HOST https://scalecluster.example.com

WORKDIR /root

ENTRYPOINT [ "/bin/bash" ]