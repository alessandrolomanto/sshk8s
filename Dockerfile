FROM       ubuntu:20.04
MAINTAINER Alessandro Lo Manto

RUN apt update

RUN apt install -y openssh-server
RUN mkdir /var/run/sshd

RUN apt install -y less curl iputils-ping vim netcat

RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config \
&& sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config \
&& sed -ri 's/^StrictModes\s+.*/StrictModes no/' /etc/ssh/sshd_config \
&& sed -ri 's/HostKey \/etc\/ssh\//HostKey \/etc\/ssh\/hostKeys\//g' /etc/ssh/sshd_config \
&& echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config \
&& echo "GatewayPorts yes" >> /etc/ssh/sshd_config

EXPOSE 22
