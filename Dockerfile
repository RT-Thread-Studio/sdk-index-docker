FROM python:3.6-slim-buster

ADD config_env.py /etc/apt/

RUN apt-get update \
    && apt-get upgrade \
    && apt-get -qq install gcc-multilib libsdl-dev libc6 libc6-dev \
    && apt-get --no-install-recommends --allow-unauthenticated --fix-broken -y install \
        wget \
        unzip \
        bzip2 \
        make \
        vim \
        git \
        ca-certificates \
        scons \
        sudo \
        python-setuptools \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && pip install click pyyaml rt_thread_studio pytest\
    && ldd --version 
  
RUN mkdir rt-thread \
    && cd /rt-thread \
    
# apt install jdk    
RUN wget -nv -c https://download.java.net/java/GA/jdk11/13/GPL/openjdk-11.0.1_linux-x64_bin.tar.gz \
    && tar -xzf openjdk-11.0.1_linux-x64_bin.tar.gz \
    && rm openjdk-11.0.1_linux-x64_bin.tar.gz 
 
# riscv toolchain
RUN wget -nv -c https://github.com/RT-Thread-Studio/sdk-toolchain-RISC-V-GCC/archive/riscv64-unknown-elf-gcc-8.3.0-linux-x64.tar.gz \
    && tar -xzf riscv64-unknown-elf-gcc-8.3.0-linux-x64.tar.gz \
    && rm riscv64-unknown-elf-gcc-8.3.0-linux-x64.tar.gz 

# arm tool chain
RUN wget -nv -c https://github.com/RT-Thread/toolchains-ci/releases/download/arm-2017q2-v6/gcc-arm-none-eabi-6-2017-q2-update-linux.tar.bz2 \
    && tar -xjf gcc-arm-none-eabi-6-2017-q2-update-linux.tar.bz2 \
    && rm gcc-arm-none-eabi-6-2017-q2-update-linux.tar.bz2 

# eclipse
RUN wget -nv -c https://github.com/eclipse-embed-cdt/org.eclipse.epp.packages/releases/download/v4.7.2-20200127-2019-12/20200127-1311-gnumcueclipse-4.7.2-2019-12-R-linux.gtk.x86_64.tar.gz \
    && tar -xzf 20200127-1311-gnumcueclipse-4.7.2-2019-12-R-linux.gtk.x86_64.tar.gz \
    && rm 20200127-1311-gnumcueclipse-4.7.2-2019-12-R-linux.gtk.x86_64.tar.gz 

RUN chmod a+x /rt-thread/eclipse/eclipse \
    && chmod -R a+x /rt-thread/gcc-arm-none-eabi-6-2017-q2-update \
    && chmod -R a+x /rt-thread/sdk-toolchain-RISC-V-GCC-riscv64-unknown-elf-gcc-8.3.0-linux-x64 \
    && python /etc/apt/config_env.py

ADD ./workspace /rt-thread/eclipse/workspace
