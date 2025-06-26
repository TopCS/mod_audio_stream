FROM debian:bookworm-slim



# you may want to populate /etc/freeswitch at this point.
# if /etc/freeswitch does not exist, the standard vanilla configuration is deployed


RUN  echo "machine freeswitch.signalwire.com login signalwire password pat_SJWGRDk7BSbwmd9XT4QwuAq1" > /etc/apt/auth.conf 
# Add FreeSWITCH repo and key
RUN echo "deb http://files.freeswitch.org/repo/deb/freeswitch-1.10.12 bookworm main" > /etc/apt/sources.list.d/freeswitch.list && \
    apt-get update && \
    apt-get install -y curl gnupg && \
    curl -s https://files.freeswitch.org/repo/deb/freeswitch-1.10.12/freeswitch_archive_g0.pub | apt-key add -

# Install build tools and dependencies
RUN apt-get update && \
    apt-get install -y \
        build-essential \
        cmake \
        pkg-config \
        debhelper \
        devscripts \
        fakeroot \
        git \
        libspeexdsp-dev \
        zlib1g-dev \
        libssl-dev \
        libfreeswitch-dev \
    && rm -rf /var/lib/apt/lists/*
# ...existing code...