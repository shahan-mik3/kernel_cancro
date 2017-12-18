DEFCONFIG=cyanogen_cancro_defconfig
OBJ_DIR=`pwd`/obj
TOOLCHAIN=${HOME}/toolchain/arm-linux-androideabi-4.9/bin/arm-linux-androidkernel-
make ARCH=arm O=$OBJ_DIR CROSS_COMPILE=${TOOLCHAIN} $DEFCONFIG
make -j32 ARCH=arm O=$OBJ_DIR CROSS_COMPILE=${TOOLCHAIN}
rm -f ~/AnyKernel2/zImage*
rm -f ~/AnyKernel2/dtb*
cp $OBJ_DIR/arch/arm/boot/zImage-dtb ~/AnyKernel2/
cp $OBJ_DIR/drivers/staging/prima/wlan.ko ~/AnyKernel2/modules/
cd ~/AnyKernel2
DATE=$(date +"%m-%d-%y")
rm *.zip
zip -r9 ZeurionX-$DATE.zip * -x README ZeurionX-$DATE.zip
cp Z* /srv/http/
