FROM ubuntu:20.04

ARG JOBNUM=2

USER root

ARG DEBIAN_FRONTEND=noninteractive

RUN rm /etc/dpkg/dpkg.cfg.d/excludes \
    && apt-get -yq update \
    && apt-get install -yq software-properties-common \
    && apt-get install -yq --no-install-recommends apt-utils \
    && dpkg -l | grep ^ii | cut -d' ' -f3 | xargs apt-get install -y --reinstall \
    && add-apt-repository ppa:ubuntu-toolchain-r/test -y \
    && add-apt-repository ppa:git-core/ppa -y

RUN apt-get -yq update --fix-missing
RUN apt-get install -yq software-properties-common
RUN apt-get install -yq git bash bash-completion zsh
RUN apt-get install -yq python-dev python3-dev python3-pip
RUN apt-get install -yq build-essential cmake automake make vim manpages-dev manpages-posix-dev man man-db lsof
RUN apt-get install -yq autoconf autoconf-archive libtool pkg-config byacc flex bison
RUN apt-get install -yq gdb valgrind locate net-tools vnstat nss-updatedb inetutils-ping
RUN apt-get install -yq tree locales sudo htop wget curl unzip dstat telnet
RUN apt-get install -yq gcc-11 g++-11 lua5.3
RUN apt-get install -yq libbison-dev libjemalloc-dev libboost-all-dev libgflags-dev libgoogle-glog-dev
RUN apt-get install -yq libkrb5-dev libssl-dev libevent-dev libev-dev libdouble-conversion-dev
RUN apt-get install -yq libiberty-dev liblz4-dev liblzma-dev libsnappy-dev zlib1g-dev binutils-dev
RUN apt-get install -yq libunwind-dev libelf-dev libdwarf-dev libsodium-dev libc++-dev libc++abi-dev libtbb-dev
RUN apt-get install -yq libavdevice-dev libpulse-dev libopus-dev libevdev-dev
RUN apt-get install -yq mysql-client libmysqlclient-dev
RUN apt-get install -yq openjdk-17-jdk

#clang13
RUN echo 'deb http://apt.llvm.org/focal/ llvm-toolchain-focal-13 main' >> /etc/apt/sources.list.d/llvm.list \
    && echo 'deb-src http://apt.llvm.org/focal/ llvm-toolchain-focal-13 main' >> /etc/apt/sources.list.d/llvm.list
RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add - \
    && apt-get -yq update \
    && apt-get install -yq clang-13 libclang-13-dev \
    && apt-get clean

RUN echo "/usr/local/lib/" >> /etc/ld.so.conf.d/usr_local_lib.conf \
    && locale-gen zh_CN.UTF-8 en_US.UTF-8 \
    && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-11 60 \
    && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-11 60 \
    && update-alternatives --install /usr/bin/clang clang /usr/bin/clang-13 60 \
    && update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-13 60 \
    && update-alternatives --install /usr/bin/clang-cpp clang-cpp /usr/bin/clang-cpp-13 60 \
    && ldconfig && updatedb

#cmake
#RUN wget https://github.com/Kitware/CMake/releases/download/v3.22.1/cmake-3.22.1.tar.gz \
#    && tar -zxf cmake-3.22.1.tar.gz \
#    && (cd cmake-3.22.1 && ./bootstrap -- -DCMAKE_BUILD_TYPE:STRING=Release && make -j${JOBNUM} && make install) \
#    && ldconfig && rm -fr cmake*

#universal-ctags
RUN git clone https://github.com/universal-ctags/ctags.git \
    && (cd ctags && ./autogen.sh && ./configure && make -j ${JOBNUM} && make install) \
    && ldconfig && rm -fr ctags*

#protobuf
#RUN git clone https://github.com/protocolbuffers/protobuf.git \
#    && (cd protobuf && git submodule update --init --recursive && ./autogen.sh && ./configure' && make -j ${JOBNUM} && make install) \
#    && ldconfig && rm -rf protobuf*

#oh-my-zsh/.vimrc/vim-plug/profiles
RUN /bin/bash -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" \
    && git clone https://github.com/helayzhang/docs.git \
    && cp -f docs/profiles/ubuntu/.vimrc ~ \
    && cp -f docs/profiles/ubuntu/.my_profile ~ \
    && cp -f docs/profiles/ubuntu/.zshrc ~ \
    && cp -f docs/profiles/ubuntu/.bashrc ~ \
    && cp -f docs/profiles/ubuntu/.ycm_extra_conf.py ~ \
    && curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

RUN ldconfig && updatedb

WORKDIR /root

ENV TERM xterm

# 首次进入容器，还需完成
# 1. vim :PlugInstall
# 2. cd ~/.vim/plugged/YouCompleteMe && python3 install.py --system-libclang --clang-completer
