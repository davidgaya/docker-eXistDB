# About this image
This is a eXist DB image build on top of official Java image (therefore based in debian jessie).

It is forked from [dariah/exist](https://hub.docker.com/r/dariah/exist/). I did this fork because I wanted an image built on top of official
images and that leverages the image cache of docker.

# eXist XML Database

eXist is an open source NoSQL database built on XML technology.
It is classified as both a NoSQL Document database and a native XML database.
eXist provides XQuery and XSLT as its query and application programming languages.

# Licenses

This fork keeps the original license. See LICENSE.txt.

eXist is released under version 2.1 of the GNU LGPL.

# Usage

admin password is set via environment variable EXIST_ADMIN_PASSWORD.

To start your container binding to port 8080:

    docker run -d -p 8080:8080 -e EXIST_ADMIN_PASSWORD=pass davidgaya/existdb:latest

You are also allowed to manipulate the max memory available for exist (default is 512M):

    docker run -P -d -e MAX_MEMORY=1024 -e EXIST_ADMIN_PASSWORD=pass davidgaya/exist:latest

Then check it at:

    curl http://localhost:8080/exist/
