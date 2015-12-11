FROM java:8
MAINTAINER David Gaya

# eXistDB need ant to automate common tasks like backup/restore or importing
RUN apt-get update; apt-get -y install ant ant-optional; apt-get clean
# install exist and cleanup
RUN wget -q -O '/opt/exist.jar' 'http://downloads.sourceforge.net/project/exist/Stable/2.2/eXist-db-setup-2.2.jar' && \
    echo 'INSTALL_PATH=/opt/exist' > '/opt/options.txt' && \
    java -jar '/opt/exist.jar' -options '/opt/options.txt' && \
    rm -f '/opt/exist.jar' '/opt/options' 

ADD entrypoint.sh /entrypoint.sh
CMD ["/entrypoint.sh"]

VOLUME /opt/exist/webapp/WEB-INF/data/

EXPOSE 8080
