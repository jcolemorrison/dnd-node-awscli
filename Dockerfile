# base from alpine 3.7
FROM docker:17.12.0-ce

RUN wget "s3.amazonaws.com/aws-cli/awscli-bundle.zip" -O "awscli-bundle.zip" && \
    unzip awscli-bundle.zip && \
    apk add --update groff less python git openssh ca-certificates && \
    rm /var/cache/apk/* && \
    ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws && \
    rm awscli-bundle.zip && \
    rm -rf awscli-bundle

# only versions available for alpine 3.6
ARG NODE_VERSION=8.9.3-r1

ENV PATH /root/.yarn/bin:$PATH

RUN apk add --update nodejs=${NODE_VERSION} curl && \
  rm -rf /var/cache/apk/*

# Not using APK because 3.6 doesn't have an available 1.0 version of Yarn
ARG YARN_VERSION=1.3.2

RUN curl -o- -L https://yarnpkg.com/install.sh | sh -s -- --version ${YARN_VERSION}
