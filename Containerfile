from ubuntu:20.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive \
	apt-get install -y git build-essential cmake libsctp1 libsctp-dev \
		libz-dev libcurl4-openssl-dev autoconf automake libtool \
		bison flex libboost-all-dev python3
COPY 3rdp/oran-e2sim /e2
RUN mkdir /e2/e2sim/build && cd /e2/e2sim/build \
	&& cmake .. -DDEV_PKG=1 -DLOG_LEVEL=3 \
	&& make package && dpkg --install ./e2sim-dev_1.0.0_amd64.deb \
	&& ldconfig
COPY 3rdp/ns-3-mmwave-oran /ns3
COPY 3rdp/sim-ns3-o-ran-e2 /ns3/contrib/oran-interface
RUN cd /ns3 && ./waf configure --enable-examples --enable-tests
RUN cd /ns3 && ./waf build
