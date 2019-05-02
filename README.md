# MATLAB on Docker

This is a Docker image to run MATLAB R2017b and other versions on Docker, but without including the huge and copyright-tainted MATLAB installation in the actual Docker container. Instead, the installation including the license file is mounted into the container via a read-only volume.

Advantage: Docker image may be redistributed without copyright hassle

Disadvantage: depends on external MATLAB installation, therefore less reproducible

## Usage

`./run.sh` builds the container and runs my_matlab_script.m inside the container.

## Using with Gitlab CI

The provided `.gitlab-ci.yml` file can be used with a GitLab CI shell runner -- see the file for details. Please note that, by design, shell runners provide no separation and must not be used with untrusted code.

## Security

This is a proof-of-concept demonstration, definitely not bulletproof.

## Copyright

Do whatever you like (legally: CC0 License)
