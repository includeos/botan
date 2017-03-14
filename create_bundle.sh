#!/bin/bash

TARFILE="botan-includeos.tar.gz"
tar -chzf $TARFILE --exclude "build/include/botan/internal" libbotan-2.a build/include/botan
echo -e "> Created $TARFILE"