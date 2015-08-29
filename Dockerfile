FROM ubuntu:14.04

MAINTAINER "leafmuch <jes.ferrier@gmail.com>"

RUN apt update && apt install -y \
    curl \
    zlib1g-dev \
    patch \
    make \
    build-essential \
    openssh-client \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# Installs chef-client
RUN curl -k -L https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/10.04/x86_64/chef_12.4.1-1_amd64.deb --output /tmp/chef_12.4.1-1_amd64.deb
RUN dpkg -i /tmp/chef_12.4.1-1_amd64.deb
RUN rm /tmp/chef_12.4.1-1_amd64.deb

# Installs knife-ec2 gem with chef's gem binary
RUN /opt/chef/embedded/bin/gem install knife-ec2

CMD /bin/bash
