FROM dperson/smokeping

# change root password prior to deploying
RUN apt-get update && \
  apt-get install -y git \
  python-pip

RUN pip install speedtest-cli

# Grab the patch that fixes storing RRD values > 180
RUN curl https://raw.githubusercontent.com/oetiker/SmokePing/60419834f224a0735094fd4ad0aac8eac3b15289/lib/Smokeping.pm > /usr/share/perl5/Smokeping.pm
  
COPY ./speedtest.pm /usr/share/perl5/Smokeping/probes/

# copy the edited targets and probes files
COPY Probes /etc/smokeping/config.d/
COPY Targets /etc/smokeping/config.d/
COPY Presentation /etc/smokeping/config.d/

CMD /usr/bin/smokeping.sh
