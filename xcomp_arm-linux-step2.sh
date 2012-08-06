#!/bin/csh

echo ""
echo "You must run xcomp_arm-linux-step1.sh before running this"
echo ""
mv Makefile Makefile.org
sed -e "s/^CC.*gcc/CC=\/home\/dev\/CodeSourcery\/Sourcery_G++\/bin\/arm-none-linux-gnueabi-gcc/g" < Makefile.org > Makefile2
sed -e "s/^CFLAG=/CFLAG=-static -I..\/..\/..\/zlib-1.2.3\/arm-linux\/include/g" < Makefile2 > Makefile3
sed -e "s/^EX_LIBS=.*-lz/EX_LIBS= -ldl ..\/..\/zlib-1.2.3\/arm-linux\/lib\/libz.a/g" < Makefile3 > Makefile

echo ""
echo "You can now run 'make' and 'make install'"
echo ""

