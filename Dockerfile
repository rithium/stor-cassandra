FROM cassandra:3.9

RUN apt-get update && apt-get -y install ruby-full make build-essential zlib1g-dev haproxy

RUN gem install synapse --no-document -v 0.13.8
RUN gem install nerve --no-document -v 0.8.0

RUN echo "ENABLED=1" > /etc/default/haproxy

ADD *.sh /opt/

ADD nerve.conf.json /etc/nerve.conf.json

RUN chmod +x /opt/startNerve.sh

COPY run.sh /run.sh

RUN chmod +x /run.sh

ENTRYPOINT /run.sh
