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
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && pip install requests click pyyaml pytest pytest-sugar pytest-xdist pytest-html rt-thread-studio \
    && ldd --version \
    && mkdir rt-thread \
    && cd /rt-thread \
    && wget -nv -c https://download.java.net/java/GA/jdk11/13/GPL/openjdk-11.0.1_linux-x64_bin.tar.gz \
    && tar -xzf openjdk-11.0.1_linux-x64_bin.tar.gz \
    && rm openjdk-11.0.1_linux-x64_bin.tar.gz \
    # riscv toolchain for 64
    && wget -nv -c https://github.com/RT-Thread-Studio/sdk-toolchain-RISC-V-GCC/archive/riscv64-unknown-elf-gcc-8.3.0-linux-x64.tar.gz \
    && tar -xzf riscv64-unknown-elf-gcc-8.3.0-linux-x64.tar.gz \
    && rm riscv64-unknown-elf-gcc-8.3.0-linux-x64.tar.gz \
    # riscv toolchain for 32
    && wget -nv -c https://github.com/xpack-dev-tools/riscv-none-embed-gcc-xpack/releases/download/v8.3.0-2.3/xpack-riscv-none-embed-gcc-8.3.0-2.3-linux-x64.tar.gz \
    && tar -xzf xpack-riscv-none-embed-gcc-8.3.0-2.3-linux-x64.tar.gz \
    && rm xpack-riscv-none-embed-gcc-8.3.0-2.3-linux-x64.tar.gz \
    # arm tool chain
    && wget -nv -c https://github.com/RT-Thread-Studio/sdk-toolchain-GNU-ARM-Embedded/archive/arm-none-eabi-gcc-9.2.1-1.1.tar.gz \
    && tar -xzf arm-none-eabi-gcc-9.2.1-1.1.tar.gz \
    && rm arm-none-eabi-gcc-9.2.1-1.1.tar.gz \
    # eclipse
    && wget -nv -c https://github.com/eclipse-embed-cdt/org.eclipse.epp.packages/releases/download/v4.7.2-20200127-2019-12/20200127-1311-gnumcueclipse-4.7.2-2019-12-R-linux.gtk.x86_64.tar.gz \
    && tar -xzf 20200127-1311-gnumcueclipse-4.7.2-2019-12-R-linux.gtk.x86_64.tar.gz \
    && rm 20200127-1311-gnumcueclipse-4.7.2-2019-12-R-linux.gtk.x86_64.tar.gz \
    && chmod a+x /rt-thread/eclipse/eclipse \
    && chmod -R a+x /rt-thread/sdk-toolchain-GNU-ARM-Embedded-arm-none-eabi-gcc-9.2.1-1.1 \
    && chmod -R a+x /rt-thread/sdk-toolchain-RISC-V-GCC-riscv64-unknown-elf-gcc-8.3.0-linux-x64 \
    && python /etc/apt/config_env.py

ADD ./workspace /rt-thread/eclipse/workspace
