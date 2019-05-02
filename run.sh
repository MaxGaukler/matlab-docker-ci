#!/bin/sh
set -e

# the matlab version and path are taken from environment variables, if present, otherwise we fall back to a default.
MATLABRELEASE=${MATLABRELEASE:-R2017b}

MATLABPATH=${MATLABPATH:-/usr/local/MATLAB/$MATLABRELEASE/}

test -x $MATLABPATH/bin/matlab || { echo "Cannot find matlab in $MATLABPATH, please set e.g. MATLABRELEASE=R2017b or MATLABPATH=/usr/local/MATLAB/R2017b/"; }

docker build . -t localhost/matlab
docker run -v $MATLABPATH:/usr/local/matlab/ -e LM_PROJECT=$LM_PROJECT localhost/matlab
