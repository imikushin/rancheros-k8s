FROM debian:jessie

# run on RancherOS with --volumes-from=all-volumes

RUN apt-get update && apt-get -y dist-upgrade
RUN apt-get install -y curl vim

COPY . /

CMD ["bash"]
