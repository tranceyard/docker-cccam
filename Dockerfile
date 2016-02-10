#FROM gliderlabs/alpine
FROM hypriot/rpi-alpine-scratch
MAINTAINER ryanfox1985 <wolf.fox1985@gmail.com>

# Update and upgrade
RUN apk update
RUN apk upgrade

COPY CCcam.x86_64 /bin/CCcam.x86_64
RUN chmod +x /bin/CCcam.x86_64

COPY CCcam.cfg /etc/CCcam.cfg
COPY CCcam.providers /etc/CCcam.providers

# Clean up APT when done.
RUN rm -rf /var/cache/apk/*

EXPOSE 12000
EXPOSE 16000
EXPOSE 16001

VOLUME ["/config"]
ENTRYPOINT ["/bin/CCcam.x86_64", "-d", "-C", "/etc/CCcam.cfg"]
