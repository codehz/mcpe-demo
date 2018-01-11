FROM busybox as unzip
COPY game.zip /game.zip
RUN mkdir /data && unzip /game.zip -d /data

FROM codehz/mcpe-server
COPY --from=unzip /data /data
COPY init.sh /root
WORKDIR /root/app
VOLUME ["/root/app"]
EXPOSE 19132
CMD /root/init.sh
