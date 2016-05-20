FROM chrisgeorge/nightmare-headless
MAINTAINER mitto nagisa<mitto@mittostar.info>

RUN sudo sed -i -e 's/httpredir.debian.org/ftp.jp.debian.org/g' /etc/apt/sources.list
RUN sudo apt-get update
RUN sudo apt-get install -y unifont \
                            fonts-vlgothic \
                            fonts-ipafont \
                            --no-install-recommends \
                            && sudo apt-get autoclean \
                            && sudo apt-get clean \
                            && sudo rm -rf /var/lib/api/lists/*

RUN mkdir -p /home/node/app/build
WORKDIR /home/node/app

COPY package.json /home/node/app/
RUN npm install
COPY main.js /home/node/app/
COPY xvfb.sh /home/node/app/
COPY run.sh /home/node/app/

CMD ["/home/node/app/run.sh"]
