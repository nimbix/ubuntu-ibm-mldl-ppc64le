FROM nimbix/ubuntu-cuda-ppc64le

# repo
WORKDIR /tmp
RUN curl -O https://public.dhe.ibm.com/software/server/POWER/Linux/mldl/ubuntu/mldl-repo-local_4.0.0_ppc64el.deb && \
	dpkg --install mldl*.deb && rm -f mldl*.deb

# install packages
RUN apt-get update && apt-get -y install power-mldl numactl && apt-get clean
ADD motd /etc/motd
ADD help-launch.html /etc/NAE/help-launch.html
