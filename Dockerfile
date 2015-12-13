FROM java:8-jre
MAINTAINER David Gaya

# eXistDB needs ant to automate common tasks like backup/restore or importing
RUN apt-get update; apt-get -y install ant ant-optional; apt-get clean

# install exist and cleanup
RUN wget -q -O '/opt/exist.jar' 'https://bintray.com/artifact/download/existdb/releases/eXist-db-setup-2.2.jar' && \
    echo 'INSTALL_PATH=/opt/exist' > '/opt/options.txt' && \
    java -jar '/opt/exist.jar' -options '/opt/options.txt' && \
    rm -f '/opt/exist.jar' '/opt/options' 

ADD entrypoint.sh /entrypoint.sh
CMD ["/entrypoint.sh"]
ENV EXIST_HOME /opt/exist
VOLUME /opt/exist/webapp/WEB-INF/data/

EXPOSE 8080 8443
