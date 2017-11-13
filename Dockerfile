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
#RUN service smokeping start
#COPY . /opt/smokeping/
#RUN pip install --upgrade pip
#RUN pip install --no-cache-dir -r /opt/molevar/requirements.txt
#
#CMD python /opt/molevar/db_init.py && python /opt/molevar/app.py
CMD /usr/bin/smokeping.sh
