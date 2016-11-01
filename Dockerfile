FROM nimbix/ubuntu-cuda-ppc64le

WORKDIR /tmp
RUN wget --no-verbose http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1404/ppc64el/nvidia-machine-learning-repo-ubuntu1404_1.0.0-1_ppc64el.deb && dpkg --install nvidia-*.deb && rm -f nvidia-*.deb
RUN wget --no-verbose https://download.boulder.ibm.com/ibmdl/pub/software/server/mldl/mldl-repo-local_1-3ibm2_ppc64el.deb && dpkg --install mldl*.deb && rm -f mldl*.deb && apt-get update && apt-get -y install power-mldl && apt-get -y remove mldl-repo-local && apt-get clean
ADD motd /etc/motd
ADD help-launch.html /etc/NAE/help-launch.html
ADD AppDef.json /etc/NAE/AppDef.json
RUN wget --post-file=/etc/NAE/AppDef.json --no-verbose https://api.jarvice.com/jarvice/validate -O -

