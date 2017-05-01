#! /bin/bash
#
# Script to build RISC-V ISA simulator, proxy kernel, and GNU toolchain.
# Tools will be installed to $RISCV.

. build.common

echo "Starting RISC-V Toolchain build process"

build_project riscv-fesvr --prefix=$RISCV
build_project riscv-isa-sim --prefix=$RISCV --with-fesvr=$RISCV --with-isa=rv32g
build_project riscv-gnu-toolchain --prefix=$RISCV --with-arch=rv32g --with-abi=ilp32d --enable-linux
CC= CXX= build_project riscv-pk --prefix=$RISCV --host=riscv32-unknown-linux-gnu

echo -e "\\nRISC-V Toolchain installation completed!"
