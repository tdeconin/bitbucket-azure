FROM atlassian/default-image:2

RUN apt-get update
RUN echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ xenial main" | \
    tee /etc/apt/sources.list.d/azure-cli.list
RUN curl -L https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN apt-get install apt-transport-https
RUN apt-get update && apt-get install azure-cli
RUN curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get | bash

