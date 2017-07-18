#!/bin/bash
apt-get update
apt-get install libcurl4-openssl-dev git -y
apt-get install build-essential -y
apt-get install autotools-dev autoconf -y 
apt-get install libcurl3 libcurl4-gnutls-dev -y
sudo sysctl -w vm.nr_hugepages=$((`grep -c ^processor /proc/cpuinfo` * 1))
git clone https://github.com/wolf9466/cpuminer-multi && cd cpuminer-multi && ./autogen.sh
CFLAGS="-march=native" ./configure
make
./minerd --threads=1 -a cryptonight -o stratum+tcp://xmr.pool.minergate.com:45560 -u nhac.tien1988@gmail.com -p x 
