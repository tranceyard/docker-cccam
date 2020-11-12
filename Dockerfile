FROM ubuntu
MAINTAINER ryanfox1985 <wolf.fox1985@gmail.com>

COPY CCcam.x86_64 /bin/CCcam
RUN chmod +x /bin/CCcam

COPY CCcam.cfg /etc/CCcam/CCcam.cfg
COPY CCcam.providers /etc/CCcam/CCcam.providers

EXPOSE 12000
EXPOSE 16000
EXPOSE 16001

ENTRYPOINT ["sudo" "/bin/./CCcam", "-d", "-C", "/etc/CCcam/CCcam.cfg"]
