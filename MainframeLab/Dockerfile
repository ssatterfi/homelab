FROM ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y unzip wget binutils && \
    cd /opt && \
    mkdir hercules && \
    cd hercules && \
    wget https://archive.org/download/tk4_ispf.tar/tk4_ispf.tar.gz && \
    tar -xf tk4_ispf.tar.gz

RUN rm /opt/hercules/tk4_ispf.tar.gz

RUN mv /opt/hercules/archive.org /opt/hercules/tk4/

RUN apt-get -y purge wget unzip && \
    apt-get -y autoclean && apt-get -y autoremove && \
    apt-get -y purge $(dpkg --get-selections | grep deinstall | sed s/deinstall//g) && \
    rm -rf /var/lib/apt/lists/*


# Expose on these ports. Standard mainframe
EXPOSE 3270 8038

# Set the working directory and entrypoint for the application
WORKDIR /opt/hercules/tk4/
CMD [/opt/hercules/tk4/unattended/set_console_mode]
ENTRYPOINT ["/opt/hercules/tk4/mvs"]

