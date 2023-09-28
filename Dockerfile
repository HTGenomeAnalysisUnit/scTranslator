FROM nvidia/cuda:11.1.1-cudnn8-devel-ubuntu20.04
#Alternatively we can try 12.1.0-cudnn8-devel-ubuntu22.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	cmake \
	git \
	libboost-all-dev \
	libbz2-dev \
	liblzma-dev \
	libncurses5-dev \
	libncursesw5-dev \
	libssl-dev \
	libtbb-dev \
	libz-dev \
	python3 \
	python3-dev \
	python3-pip \
	python3-setuptools \
	zlib1g-dev \
	zlib1g \
	libffi-dev \
	xz-utils \
	libsqlite3-dev \
	sqlite3 \
	libreadline-dev \
	tk-dev \
	libgdbm-dev \
	libdb-dev \
	libdb++-dev \
	libpcap-dev \
	libexpat1-dev \
	&& apt-get clean && apt-get purge

RUN	pip install requests tornado \
	&& pip install scipy pandas numpy scanpy scikit-learn einops \
	&& rm -rf ~/.cache/pip && rm -rf /root/.cache/pip \
	&& pip install torch==1.6.0 torchvision==0.7.0 local-attention \
	&& rm -rf ~/.cache/pip && rm -rf /root/.cache/pip

#Clone scTranslator from our fork with small fixes
WORKDIR /opt
RUN git clone https://github.com/HTGenomeAnalysisUnit/scTranslator.git