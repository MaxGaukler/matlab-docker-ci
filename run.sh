#!/bin/sh
set -e

# change to script directory
cd "$(dirname "$0")"

# the Matlab version and path are taken from environment variables, if present, otherwise we fall back to a default.
MATLABRELEASE=${MATLABRELEASE:-R2017b}
MATLABPATH=${MATLABPATH:-/usr/local/MATLAB/$MATLABRELEASE/}

# Check for Matlab executable
test -x $MATLABPATH/bin/matlab || { echo "Cannot find matlab in $MATLABPATH, please set e.g. MATLABRELEASE=R2017b or MATLABPATH=/usr/local/MATLAB/R2017b/"; }

# Build and run container
rm -rf ./output/
mkdir -p ./output
# TODO FIXME: to work around permission issues, we make the output directory world-writable. That's a bad idea if you are using a shared computer -- then, please ensure that ./ is not accessible to others (permission 700).
chmod 777 ./output
docker build . -t localhost/matlab
docker run -v "$MATLABPATH:/usr/local/matlab/" -e "LM_PROJECT=$LM_PROJECT" -v "$(pwd)/output:/myscript/output/" localhost/matlab
