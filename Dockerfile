FROM igeolise/sbt:0.13.12-openjdk-8

RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
     nodejs=4.2.6~dfsg-1ubuntu4.1 \
     nodejs-legacy=4.2.6~dfsg-1ubuntu4.1 \
     bzip2=1.0.6-8 xvfb=2:1.18.4-0ubuntu0.1 \
     chromium-browser=53.0.2785.143-0ubuntu0.16.04.1.1257 \
     npm=3.5.2-0ubuntu4 \
     unzip=6.0-20ubuntu1

RUN npm install -g phantomjs-prebuilt@2.1.7
RUN npm install jsdom@9.8.3
    
RUN curl -sS -o /tmp/chromedriver_linux64.zip https://chromedriver.storage.googleapis.com/2.25/chromedriver_linux64.zip && \
	mkdir /opt/chromedriver && \
	unzip -qq /tmp/chromedriver_linux64.zip -d /opt/chromedriver && \
	rm /tmp/chromedriver_linux64.zip && \
	chmod +x /opt/chromedriver/chromedriver && \
	ln -fs /opt/chromedriver/chromedriver /usr/local/bin/chromedriver

