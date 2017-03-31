FROM nimbix/ubuntu-cuda-ppc64le

# repo
WORKDIR /tmp
RUN curl -O http://download.boulder.ibm.com/ibmdl/pub/software/server/mldl/mldl-repo-local_3.3.0_ppc64el.deb && \
	dpkg --install mldl*.deb && rm -f mldl*.deb

# install packages
RUN apt-get update && apt-get -y install power-mldl openmpi-bin numactl libopenmpi-dev && apt-get clean
ADD motd /etc/motd
ADD help-launch.html /etc/NAE/help-launch.html
