# base from alpine 3.6
FROM docker:17.06.0-ce

RUN wget "s3.amazonaws.com/aws-cli/awscli-bundle.zip" -O "awscli-bundle.zip" && \
    unzip awscli-bundle.zip && \
    apk add --update groff less python git openssh ca-certificates && \
    rm /var/cache/apk/* && \
    ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws && \
    rm awscli-bundle.zip && \
    rm -rf awscli-bundle

# only versions available for alpine 3.6
ARG YARN_VERSION=0.23.3-r0
ARG NODE_VERSION=6.10.3-r1
ARG NPM_VERSION=6.10.3-r1

ENV PATH /root/.yarn/bin:$PATH

RUN apk add --update nodejs=${NODE_VERSION} yarn=${YARN_VERSION} nodejs-npm=${NPM_VERSION} && \
  rm -rf /var/cache/apk/*
