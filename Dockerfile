FROM igeolise/sbt:0.13.12-openjdk-8

RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -


RUN apt-get update && apt-get install -y --no-install-recommends --fix-missing nodejs=4.2.6~dfsg-1ubuntu4.1
RUN apt-get update && apt-get install -y --no-install-recommends --fix-missing nodejs-legacy=4.2.6~dfsg-1ubuntu4.1
RUN apt-get update && apt-get install -y --no-install-recommends --fix-missing bzip2=1.0.6-8
RUN apt-get update && apt-get install -y --no-install-recommends --fix-missing xvfb
RUN apt-get update && apt-get install -y --no-install-recommends --fix-missing chromium-browser=53.0.2785.143-0ubuntu0.16.04.1.1257
RUN apt-get update && apt-get install -y --no-install-recommends --fix-missing npm=3.5.2-0ubuntu4
RUN apt-get update && apt-get install -y --no-install-recommends --fix-missing libgconf-2-4
RUN apt-get update && apt-get install -y --no-install-recommends --fix-missing unzip=6.0-20ubuntu1 
RUN apt-get update && apt-get install -y --no-install-recommends --fix-missing kmod 

RUN ln -s /usr/bin/nodejs /usr/sbin/node

RUN npm install -g phantomjs-prebuilt@2.1.7
RUN npm install jsdom@9.8.3

    
RUN curl -sS -o /tmp/chromedriver_linux64.zip https://chromedriver.storage.googleapis.com/2.25/chromedriver_linux64.zip && \
	mkdir /opt/google && \
	unzip -qq /tmp/chromedriver_linux64.zip -d /opt/google && \
	rm /tmp/chromedriver_linux64.zip && \
	chmod +x /opt/google/chromedriver && \
	ln -fs /opt/google/chromedriver /usr/local/bin/chromedriver
