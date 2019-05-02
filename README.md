# MATLAB on Docker

This is a Docker image to run MATLAB R2017b and other versions on Docker, but without including the huge and copyright-tainted MATLAB installation in the actual Docker container. Instead, the installation including the license file is mounted into the container via a read-only volume.
