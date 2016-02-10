FROM hypriot/rpi-alpine-scratch
MAINTAINER ryanfox1985 <wolf.fox1985@gmail.com>

# Update and upgrade
RUN apk update
RUN apk upgrade

COPY CCcam.armeb /bin/CCcam
RUN chmod +x /bin/CCcam

COPY CCcam.cfg /etc/CCcam.cfg
COPY CCcam.providers /etc/CCcam.providers

# Clean up APT when done.
RUN rm -rf /var/cache/apk/*

EXPOSE 12000
EXPOSE 16000
EXPOSE 16001

VOLUME ["/config"]
ENTRYPOINT ["/bin/CCcam", "-d", "-C", "/etc/CCcam.cfg"]
