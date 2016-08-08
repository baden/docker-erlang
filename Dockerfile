FROM baden/debian

ENV DEBIAN_FRONTEND="noninteractive" \
  DE_ERLANG="1:19.0-1"

RUN mkdir /tmp/erlang-build && \
  cd /tmp/erlang-build && \
  apt-get -y update && \
  apt-get -y install wget build-essential git && \
  wget http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && \
  dpkg -i erlang-solutions_1.0_all.deb && \
  apt-get -y update && \
  apt-get -y -f install erlang-base-hipe=$DE_ERLANG erlang-dev=$DE_ERLANG erlang=$DE_ERLANG erlang-asn1=$DE_ERLANG erlang-common-test=$DE_ERLANG erlang-corba=$DE_ERLANG erlang-crypto=$DE_ERLANG erlang-diameter=$DE_ERLANG erlang-edoc=$DE_ERLANG erlang-eldap=$DE_ERLANG erlang-erl-docgen=$DE_ERLANG erlang-eunit=$DE_ERLANG erlang-gs=$DE_ERLANG erlang-ic=$DE_ERLANG erlang-inets=$DE_ERLANG erlang-megaco=$DE_ERLANG erlang-mnesia=$DE_ERLANG erlang-odbc=$DE_ERLANG erlang-os-mon=$DE_ERLANG erlang-parsetools=$DE_ERLANG erlang-percept=$DE_ERLANG erlang-pman=$DE_ERLANG erlang-public-key=$DE_ERLANG erlang-reltool=$DE_ERLANG erlang-runtime-tools=$DE_ERLANG erlang-snmp=$DE_ERLANG erlang-ssh=$DE_ERLANG erlang-ssl=$DE_ERLANG erlang-ssl=$DE_ERLANG erlang-syntax-tools=$DE_ERLANG erlang-test-server=$DE_ERLANG erlang-toolbar=$DE_ERLANG erlang-tools=$DE_ERLANG erlang-tv=$DE_ERLANG erlang-typer=$DE_ERLANG erlang-webtool=$DE_ERLANG erlang-xmerl=$DE_ERLANG erlang-src=$DE_ERLANG erlang-appmon=$DE_ERLANG erlang-debugger=$DE_ERLANG erlang-dialyzer=$DE_ERLANG erlang-et=$DE_ERLANG erlang-inviso=$DE_ERLANG erlang-observer=$DE_ERLANG erlang-wx=$DE_ERLANG && \
  cd $HOME && \
  rm -rf /tmp/erlang-build && \
  apt-get clean

# Install rebar3
RUN git clone https://github.com/rebar/rebar3/ /tmp/rebar3 && \
  cd /tmp/rebar3                                                   && \
  ./bootstrap                                                      && \
  chmod a+x ./rebar3                                               && \
  mv ./rebar3 /usr/bin/                                            && \
  cd /                                                             && \
  rm -rf /tmp/rebar3

CMD ["erl"]
