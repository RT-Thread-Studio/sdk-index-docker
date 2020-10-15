import os
import textwrap


def increase_env():
    env_path = "/etc/profile"
    env = """
        export JAVA_HOME=/rt-thread/jdk-11.0.1
        export JRE_HOME=${JAVA_HOME}/jre
        export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
        export PATH=${JAVA_HOME}/bin:$PATH
        export PATH=/rt-thread/sdk-toolchain-GNU-ARM-Embedded-arm-none-eabi-gcc-9.2.1-1.1/bin:$PATH
        export PATH=/rt-thread/sdk-toolchain-RISC-V-GCC-riscv64-unknown-elf-gcc-8.3.0-linux-x64/bin:$PATH
        """
    env = textwrap.dedent(env)
    with open(env_path, 'a') as f:
        f.write(env)

if __name__ == "__main__":
    increase_env()
