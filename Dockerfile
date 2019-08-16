FROM atlassian/default-image:2

RUN apt-get update
RUN apt-get install -y apt-transport-https xvfb
RUN echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ xenial main" | \
    tee /etc/apt/sources.list.d/azure-cli.list
RUN curl -L https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN apt-get update && apt-get install azure-cli
RUN curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get | bash
RUN curl -o geckodriver.tgz https://github.com/mozilla/geckodriver/releases/download/v0.24.0/geckodriver-v0.24.0-linux64.tar.gz
RUN tar xzvf geckodriver.tgz
RUN mv geckodriver /usr/local/bin/geckodriver
