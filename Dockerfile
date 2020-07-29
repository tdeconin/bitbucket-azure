FROM node:14-buster

RUN apt-get update
RUN apt-get install -y apt-transport-https xvfb firefox-esr git curl ssh 
RUN echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ buster main" | \
    tee /etc/apt/sources.list.d/azure-cli.list
RUN curl -L https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN apt-get update && apt-get install azure-cli
RUN curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get | bash
RUN wget -O geckodriver.tgz https://github.com/mozilla/geckodriver/releases/download/v0.24.0/geckodriver-v0.24.0-linux64.tar.gz
RUN tar xvf geckodriver.tgz
RUN mv geckodriver /usr/local/bin/geckodriver
