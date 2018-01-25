FROM busybox as unzip
COPY game.zip /game.zip
COPY prepare.sh /prepare.sh
RUN /prepare.sh

FROM codehz/mcpe-server as server

FROM busybox
COPY --from=unzip app /root/app
COPY --from=server /* /root/
COPY init.sh /root
RUN mkdir /lib /data && mv /root/*.so* /lib && cp /root/server /root/app && ln -s /data /root/app/games
WORKDIR /root/app
VOLUME ["/data"]
ENV XDG_DATA_HOME=/root/app/games
EXPOSE 19132:19132/udp
CMD /root/init.sh
