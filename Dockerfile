FROM dperson/smokeping

# change root password prior to deploying
RUN apt-get update && \
  apt-get install -y git \
  python-pip

RUN pip install speedtest-cli
# /usr/local/bin/speedtest-cli
  
COPY ./speedtest.pm /usr/share/perl5/Smokeping/probes/
# copy the edited targets and probes files
COPY Probes /etc/smokeping/config.d/
COPY Targets /etc/smokeping/config.d/
COPY Presentation /etc/smokeping/config.d/

CMD /usr/bin/smokeping.sh
