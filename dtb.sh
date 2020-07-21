#!/bin/bash

export ARCH=arm64
export CROSS_COMPILE="ccache ../toolchain/bin/aarch64-unknown-linux-gnu-"
export ANDROID_MAJOR_VERSION=q

make exynos7885-a30_defconfig
make exynos/dtbo/exynos7904-a30_swa_open_00.dtbo
make exynos/dtbo/exynos7904-a30_swa_open_01.dtbo
make exynos/dtbo/exynos7904-a30_swa_open_02.dtbo
make exynos/dtbo/exynos7885.dtb
./tools/mkdtboimg.py create arch/arm64/boot/dtbo.img --id=0x0 --rev=0x0 arch/arm64/boot/dts/exynos/dtbo/exynos7904-a30_swa_open_00.dtbo arch/arm64/boot/dts/exynos/dtbo/exynos7904-a30_swa_open_01.dtbo arch/arm64/boot/dts/exynos/dtbo/exynos7904-a30_swa_open_02.dtbo
./tools/mkdtboimg.py create arch/arm64/boot/dt.img arch/arm64/boot/dts/exynos/dtbo/exynos7885.dtb
