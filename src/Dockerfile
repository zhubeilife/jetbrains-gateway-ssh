FROM ubuntu:bionic

LABEL maintainer="vollborn <oliver.vollborn@gmail.com>"
LABEL version="1.0"
LABEL description="A simple ssh server for JetBrains Gateway"

ENV SSH_USERNAME=kubot
ENV SSH_PASSWORD=kubot

RUN apt-get update && apt-get install -y ca-certificates

ADD startup.sh /startup.sh
ADD sources.list /etc/apt
ADD ssh /home/kubot/.ssh
RUN ["chmod", "0600", "/home/kubot/.ssh/*"]

RUN groupadd -r kubot && useradd -r -g kubot kubot

RUN apt-get update && apt-get upgrade -y && \
	apt-get install -y openssh-server curl build-essential \
	curl proxychains xclip dos2unix \
	cmake  fonts-powerline vim \
	tree  git aria2 astyle automake \
	bc autoconf gdb python3-pip exuberant-ctags \
	net-tools htop \
	p7zip*  inxi zsh unrar pkgconf \
	bash && \
	chmod +x /startup.sh

VOLUME [ "/home/kubot" ]
WORKDIR /home/kubot

RUN ["chown", "-R", "kubot", "/home/kubot"]

EXPOSE 22

CMD [ "/startup.sh" ]
