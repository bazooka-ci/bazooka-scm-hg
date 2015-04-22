FROM debian:jessie

RUN apt-get update \
	&& apt-get install -y mercurial \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD run.sh /run.sh
RUN echo "    IdentityFile /bazooka-key" >> /etc/ssh/ssh_config
RUN echo "    StrictHostKeyChecking no" >> /etc/ssh/ssh_config
RUN echo "    LogLevel DEBUG" >> /etc/ssh/ssh_config
RUN echo "[trusted]" > /etc/mercurial/hgrc
RUN echo "users = *" >> /etc/mercurial/hgrc
RUN echo "groups = *" >> /etc/mercurial/hgrc
RUN echo "[extensions]" >> /etc/mercurial/hgrc
RUN echo "purge =" >> /etc/mercurial/hgrc

CMD ["/run.sh"]
