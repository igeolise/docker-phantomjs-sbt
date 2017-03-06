FROM igeolise/sbt:0.13.12-openjdk-8

RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -

RUN apt-get update && \
    apt-get install -y --no-install-recommends nodejs=4.2.6~dfsg-1ubuntu4.1 && \
    apt-get install -y --no-install-recommends nodejs-legacy=4.2.6~dfsg-1ubuntu4.1 && \
    apt-get install -y --no-install-recommends bzip2=1.0.6-8 && \
    apt-get install -y --no-install-recommends xvfb && \
    apt-get install -y --no-install-recommends chromium-browser && \
    apt-get install -y --no-install-recommends npm=3.5.2-0ubuntu4 && \
    apt-get install -y --no-install-recommends libgconf-2-4 && \
    apt-get install -y --no-install-recommends unzip=6.0-20ubuntu1  && \
    apt-get install -y --no-install-recommends kmod  && \
    apt-get install -y --no-install-recommends git && \
    rm -rf /var/lib/apt/lists/*

RUN ln -s /usr/bin/nodejs /usr/sbin/node

RUN npm install -g phantomjs-prebuilt@2.1.7
RUN npm install jsdom@9.8.3

RUN curl -sS -o /tmp/chromedriver_linux64.zip https://chromedriver.storage.googleapis.com/2.25/chromedriver_linux64.zip && \
	mkdir /opt/google && \
	unzip -qq /tmp/chromedriver_linux64.zip -d /opt/google && \
	rm /tmp/chromedriver_linux64.zip && \
	chmod +x /opt/google/chromedriver && \
	ln -fs /opt/google/chromedriver /usr/local/bin/chromedriver
