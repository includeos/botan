#!/bin/bash

# 1. Configure botan for includeos

# 1.1. Mac
# ./configure.py --os=includeos --cpu=x86_32 --disable-shared --minimized  --enable-modules=sha2_64,sha2_32,x509,hkdf,hmac,dev_random,tls,system_rng --cc=clang --cc-abi-flags="--target=i686-elf -D_LIBCPP_HAS_NO_THREADS=1 -D_GNU_SOURCE -nostdlib -nostdinc++ -L/usr/local/includeos/lib -Wl,-rpath,/usr/local/includeos/lib -msse3 -maes -mfma -mavx -I/usr/local/includeos/api/sys -I/usr/local/includeos/include/libcxx -I/usr/local/includeos/include/newlib -v"
# 1.2. Edit Makefile to i686-elf-ar
# Linux x86
# ./configure.py --os=includeos --cpu=x86_32 --disable-shared --minimized  --enable-modules=sha2_64,sha2_32,x509,hkdf,hmac,dev_random,tls,system_rng --cc=clang --cc-abi-flags="--target=i686-elf -D_LIBCPP_HAS_NO_THREADS=1 -D_GNU_SOURCE -nostdlib -nostdinc++ -L$INCLUDEOS_PREFIX/includeos/lib -Wl,-rpath,$INCLUDEOS_PREFIX/includeos/lib -mssse3 -I$INCLUDEOS_PREFIX/includeos/api/posix -I$INCLUDEOS_PREFIX/includeos/include/libcxx -I$INCLUDEOS_PREFIX/includeos/include/newlib -v"
# Linux x86_64
# ./configure.py --os=includeos --cpu=x86_64 --disable-shared --minimized  --enable-modules=sha2_64,sha2_32,x509,hkdf,hmac,dev_random,tls,system_rng --cc=clang --cc-abi-flags="--target=x86_64 -mssse3 -mno-red-zone -D_LIBCPP_HAS_NO_THREADS=1 -D_GNU_SOURCE -nostdlib -nostdinc++ -L$INCLUDEOS_PREFIX/includeos/x86_64/lib -Wl,-rpath,$INCLUDEOS_PREFIX/includeos/x86_64/lib -I$INCLUDEOS_PREFIX/includeos/api/posix -I$INCLUDEOS_PREFIX/includeos/x86_64/include/libcxx -I$INCLUDEOS_PREFIX/includeos/x86_64/include/newlib -v"

# 2. make libs
# 3. create_bundle.sh

TARFILE="botan-includeos.tar.gz"
pushd build/include
tar --exclude="botan/internal" -chzf ../../$TARFILE botan/ -C "../../" libbotan-2.a
popd
echo -e "> Created $TARFILE"
