# sdk-index-docker

![sdk-index-docker ](https://github.com/RT-Thread-Studio/sdk-index-docker/workflows/Docker-Build/badge.svg) 

**简介**：提供 sdk-index 仓库 ci 工程导入以及生成所需的 docker 环境；

**功能**：包含有 ：Eclipse，openjdk；arm-gcc 以及 riscv-gcc 编译工具链；scons，make 等常用工具；

**使用方法**：安装 docker 并拉取镜像 `docker pull realthread/sdk_index:latest`，启动 docker 容器。

| Tools                                             | Version                                                      |
| ------------------------------------------------- | ------------------------------------------------------------ |
| Eclipse IDE for GNU ARM & RISC-V C/C++ Developers | 2019-12 (4.14.0)                                             |
| openjdk                                           | openjdk 11.0.1 2018-10-16                                    |
| riscv64-unknown-elf-gcc                           | (xPack GNU RISC-V Embedded GCC, 64-bit) 8.3.0                |
| arm-none-eabi-gcc                                 | (xPack GNU Arm Embedded GCC, 64-bit) 9.2.1 20191025 (release) [ARM/arm-9-branch revision 277599] |

