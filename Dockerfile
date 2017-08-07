FROM nimbix/ubuntu-cuda-ppc64le

# repo
WORKDIR /tmp
ENV POWERAI_LINK https://public.dhe.ibm.com/software/server/POWER/Linux/mldl/ubuntu/mldl-repo-local_4.0.0_ppc64el.deb

RUN curl -O "$POWERAI_LINK" && dpkg --install mldl*.deb && rm -f mldl*.deb

# install packages
RUN apt-get update && apt-get -y upgrade && apt-get -y install power-mldl numactl && apt-get clean
ADD motd /etc/motd
ADD help-launch.html /etc/NAE/help-launch.html
