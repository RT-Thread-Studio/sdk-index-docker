import os
import textwrap


def increase_env():
    env_path = "/etc/profile"
    env = """
        export JAVA_HOME=/rt-thread/jdk-11.0.1
        export JRE_HOME=${JAVA_HOME}/jre
        export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
        export PATH=${JAVA_HOME}/bin:$PATH
        export PATH=/rt-thread/gcc-arm-none-eabi-6-2017-q2-update/bin:$PATH
        export PATH=/rt-thread/sdk-toolchain-RISC-V-GCC-riscv64-unknown-elf-gcc-8.3.0-linux-x64/bin:$PATH
        export PATH=/rt-thread/xpack-riscv-none-embed-gcc-8.3.0-2.3/bin:$PATH
        export PATH=/rt-thread/arm-linux-musleabi-cross-1.0.0/bin:$PATH
        export PATH=/gcc-arm-none-eabi-10-2020-q4-major-x86_64-linux/bin:&PATH
        """
    env = textwrap.dedent(env)
    with open(env_path, 'a') as f:
        f.write(env)

if __name__ == "__main__":
    increase_env()
