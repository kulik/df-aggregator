FROM python:3.9.16-bullseye
ENV LC_ALL C
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true
ENV TERM xterm
EXPOSE 8081

MAINTAINER Yevgen Kulik <kxamed@gmail.com>
USER root
RUN apt-get update

# Run at begin
ADD . /home/root/scripts
WORKDIR /home/root/scripts
RUN pip3 install -r requirements.txt

CMD ["python", "df-aggregator.py", "-d", "/home/root/kraken-map/kraken-map.db", "-r", "/home/root/kraken-map/sensors.txt", "--ip","0.0.0.0"]
#CMD ["python", "df-aggregator.py -d /home/root/kraken-map/kraken-map.db"]
