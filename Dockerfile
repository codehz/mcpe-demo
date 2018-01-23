FROM busybox as unzip
COPY game.zip /game.zip
RUN mkdir /data && unzip /game.zip -d /data

FROM codehz/mcpe-server as server

FROM busybox
COPY --from=unzip /data /data
COPY --from=server /* /root/
COPY init.sh /root
RUN mkdir /lib && cp /root/*.so* /lib
WORKDIR /root/app
VOLUME ["/root/app/games"]
EXPOSE 19132:19132/udp
CMD /root/init.sh
