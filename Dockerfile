# base from alpine 3.6
FROM docker:17.10.0-ce

RUN wget "s3.amazonaws.com/aws-cli/awscli-bundle.zip" -O "awscli-bundle.zip" && \
    unzip awscli-bundle.zip && \
    apk add --update groff less python git openssh ca-certificates && \
    rm /var/cache/apk/* && \
    ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws && \
    rm awscli-bundle.zip && \
    rm -rf awscli-bundle

# only versions available for alpine 3.6
ARG NODE_VERSION=6.10.3-r1
ARG NPM_VERSION=6.10.3-r1

ENV PATH /root/.yarn/bin:$PATH

RUN apk add --update nodejs=${NODE_VERSION} nodejs-npm=${NPM_VERSION} curl && \
  rm -rf /var/cache/apk/*

# Not using APK because 3.6 doesn't have an available 1.0 version of Yarn
ARG YARN_VERSION=1.2.1

RUN curl -o- -L https://yarnpkg.com/install.sh | sh -s -- --version ${YARN_VERSION}

RUN yarn global add eslint@3.19.0 eslint-plugin-jsx-a11y@5.0.1 eslint-plugin-import@2.2.0 eslint-plugin-react@7.0.1 eslint-plugin-flowtype@2.34.0 eslint-config-airbnb@15.0.1 babel-eslint@7.1.1
