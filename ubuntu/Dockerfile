FROM ubuntu:18.04

MAINTAINER helayzhang "helayzhang@gmail.com"

ARG JOBNUM=2

USER root

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get -yq update
RUN apt-get install -yq --no-install-recommends apt-utils
RUN apt-get install -yq software-properties-common
RUN add-apt-repository ppa:ubuntu-toolchain-r/test -y

RUN apt-get -yq update \
    && apt-get install -yq git bash bash-completion zsh \
    && apt-get install -yq python-dev python3-dev \
    && apt-get install -yq build-essential cmake automake vim manpages-dev man man-db lsof \
    && apt-get install -yq autoconf autoconf-archive libtool pkg-config byacc flex bison \
    && apt-get install -yq gdb valgrind locate net-tools vnstat nss-updatedb inetutils-ping \
    && apt-get install -yq tree locales sudo htop wget curl unzip \
    && apt-get install -yq gcc-8 g++-8 \
    && apt-get install -yq libbison-dev libjemalloc-dev libboost-all-dev libgflags-dev libgoogle-glog-dev \
    && apt-get install -yq libkrb5-dev libssl-dev libevent-dev libev-dev libdouble-conversion-dev \
    && apt-get install -yq libiberty-dev liblz4-dev liblzma-dev libsnappy-dev zlib1g-dev binutils-dev \
    && apt-get install -yq libunwind8-dev libelf-dev libdwarf-dev libsodium-dev \
    && apt-get install -yq mysql-client libmysqlclient-dev \
    && apt-get install -yq openjdk-8-jdk \
    && apt-get clean

#clang7
RUN echo 'deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-7 main' >> /etc/apt/sources.list \
    && echo 'deb-src http://apt.llvm.org/xenial/ llvm-toolchain-xenial-7 main' >> /etc/apt/sources.list \
    && wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add - \
    && apt-get -yq update \
    && apt-get install -yq libclang-7-dev \
    && apt-get clean

RUN echo "/usr/local/lib/" >> /etc/ld.so.conf.d/usr_local_lib.conf \
    && locale-gen zh_CN.UTF-8 en_US.UTF-8 \
    && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 60 \
    && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-8 60 \
    && ldconfig && updatedb

#zstd
RUN wget -O zstd-1.3.7.tar.gz https://github.com/facebook/zstd/releases/download/v1.3.7/zstd-1.3.7.tar.gz \
    && tar -zxf zstd-1.3.7.tar.gz \
    && (cd zstd-1.3.7/build/cmake && cmake . -DBUILD_SHARED_LIBS=ON && make -j ${JOBNUM} && make install) \
    && ldconfig && rm -fr zstd*

#mstch
RUN wget -O mstch-1.0.2.tar.gz https://github.com/no1msd/mstch/archive/1.0.2.tar.gz \
    && tar zxf mstch-1.0.2.tar.gz \
    && (cd mstch-1.0.2 && sed -i 's/STATIC//g' src/CMakeLists.txt \
        && cmake . -DBUILD_SHARED_LIBS=ON && make -j ${JOBNUM} && make install) \
    && ldconfig && rm -fr mstch*

#folly
RUN wget -O folly-2018.11.26.00.tar.gz https://github.com/facebook/folly/archive/v2018.11.26.00.tar.gz \
    && tar zxf folly-2018.11.26.00.tar.gz \
    && (cd folly-2018.11.26.00 && cmake -DBUILD_SHARED_LIBS=ON -DCMAKE_POSITION_INDEPENDENT_CODE=ON . && make -j ${JOBNUM} && make install) \
    && ldconfig && rm -rf folly* 

#fizz
RUN wget -O fizz-2018.11.26.00.tar.gz https://github.com/facebookincubator/fizz/archive/v2018.11.26.00.tar.gz \
    && tar zxf fizz-2018.11.26.00.tar.gz \
    && (cd fizz-2018.11.26.00/fizz && cmake . && make -j ${JOBNUM} && make install) \
    && ldconfig && rm -rf fizz* 

#wangle
RUN wget -O wangle-2018.11.26.00.tar.gz https://github.com/facebook/wangle/archive/v2018.11.26.00.tar.gz \
    && tar zxf wangle-2018.11.26.00.tar.gz \
    && (cd wangle-2018.11.26.00/wangle && cmake . && make -j ${JOBNUM} && make install) \
    && ldconfig && rm -rf wangle* 

#fbthrift
RUN wget -O fbthrift-2018.11.26.00.tar.gz https://github.com/facebook/fbthrift/archive/v2018.11.26.00.tar.gz \
    && tar zxf fbthrift-2018.11.26.00.tar.gz \
    && (cd fbthrift-2018.11.26.00 && cmake . -DBUILD_SHARED_LIBS=ON && make -j ${JOBNUM} && make install) \
    && ldconfig && rm -fr fbthrift*

#rocksdb
RUN wget -O rocksdb-5.17.2.tar.gz https://github.com/facebook/rocksdb/archive/v5.17.2.tar.gz \
    && tar zxf rocksdb-5.17.2.tar.gz \
    && (cd rocksdb-5.17.2 && cmake . -DWITH_TESTS=OFF -DWITH_JEMALLOC=ON -DWITH_SNAPPY=ON \
        -DWITH_LZ4=ON -DWITH_ZLIB=ON -DWITH_ZSTD=ON -DWITH_GFLAGS=ON -DBUILD_SHARED_LIBS=ON \
        && make -j ${JOBNUM} && make install) \
    && ldconfig && rm -fr rocksdb*

#universal-ctags
RUN git clone https://github.com/universal-ctags/ctags.git \
    && (cd ctags && ./autogen.sh && ./configure && make -j ${JOBNUM} && make install) \
    && ldconfig && rm -fr ctags*

#golang
RUN wget https://dl.google.com/go/go1.11.2.linux-amd64.tar.gz \
    && tar -C /usr/local -xzf go1.11.2.linux-amd64.tar.gz \
    && rm -rf go* && mkdir -p /root/codes/go/bin
      
ENV GOROOT /usr/local/go
ENV GOPATH /root/codes/go
ENV PATH $PATH:$GOROOT/bin:$GOPATH/bin

RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf \
    && /bin/bash -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" \
    && git clone https://github.com/helayzhang/docs.git \
    && cp -f docs/profiles/ubuntu/.vimrc ~/.vimrc \
    && cp -f docs/profiles/ubuntu/.my_profile ~/.my_profile \
    && cp -f docs/profiles/ubuntu/.zshrc ~/.zshrc \
    && curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#    && vim +PlugInstall +qall \
#    && (cd ~/.vim/plugged/YouCompleteMe && python3 install.py --clang-completer --system-boost --system-libclang) \
#    && cp -f docs/profiles/ubuntu/.vimrc ~/.vimrc \
#    && rm -rf docs*

RUN ldconfig && updatedb \
    && echo "ulimit -n 1000000" >> ~/.bashrc \
    && echo "ulimit -c unlimited" >> ~/.bashrc 

WORKDIR /root

ENV TERM xterm
