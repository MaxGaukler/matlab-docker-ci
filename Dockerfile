FROM ubuntu:18.04



ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -q update && apt-get install -qy build-essential xorg

# for network licenses, LM_PROJECT may need to be set from outside via
# docker run .... -e LM_PROJECT=foobar

# MATLAB installation needs to be mounted to /usr/local/matlab via a Docker volume:
# docker run -v /usr/local/MATLAB/R2017b/:/usr/local/matlab/:ro
ENV PATH=$PATH:/usr/local/matlab/bin/

ENV UID=1000
RUN adduser user --uid $UID --disabled-password --gecos '' && \
    mkdir /myscript && \
    chown user /myscript

USER user
WORKDIR /myscript
ADD my_matlab_script.m /myscript/

# Calling a MATLAB script from commandline with proper return values is hyper complicated :-(
CMD matlab -nodisplay -nosplash -nodesktop -r "ver, disp(' '), try, my_matlab_script, disp('Success.'), exit(0), catch e, disp(e.getReport()), disp('ERROR'), exit(1), end"
