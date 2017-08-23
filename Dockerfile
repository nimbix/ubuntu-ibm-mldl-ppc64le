FROM nimbix/ubuntu-desktop-ppc64le:xenial

# repo
WORKDIR /tmp
ENV POWERAI_LINK https://public.dhe.ibm.com/software/server/POWER/Linux/mldl/ubuntu/mldl-repo-local_4.0.0_ppc64el.deb

RUN curl -O "$POWERAI_LINK" && dpkg --install mldl*.deb && rm -f mldl*.deb

# install packages
RUN apt-get update && apt-get -y upgrade && apt-get -y install power-mldl numactl && apt-get clean
COPY motd /etc/motd
COPY motd /etc/powerai_help.txt
COPY powerai_help.desktop /etc/skel/Desktop/powerai_help.desktop
RUN chmod 555 /etc/skel/Desktop/powerai_help.desktop
RUN echo "*** Press Q to exit help." >>/etc/powerai_help.txt
COPY help-launch.html /etc/NAE/help-launch.html
