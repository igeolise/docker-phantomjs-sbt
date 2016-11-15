FROM igeolise/sbt:0.13.12-openjdk-8

RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -

RUN apt-get update && \
    apt-get install -y --no-install-recommends nodejs bzip2

RUN npm install -g phantomjs-prebuilt	
RUN npm install jsdom
    
