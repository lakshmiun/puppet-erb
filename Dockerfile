FROM ubuntu:22.04

LABEL name="puppet-erb"
LABEL repository="https://github.com/lakshmiun/puppet-erb"
LABEL homepage="https://github.com/lakshmiun/puppet-erb"

LABEL "com.github.actions.name"="puppet-erb"
LABEL "com.github.actions.description"="GitHub Action to run 'puppet parser validate' syntax check"
LABEL "com.github.actions.icon"="share-2"
LABEL "com.github.actions.color"="orange"

LABEL "maintainer"="Sahaja Undavalli <https://github.com/lakshmiun/>"

RUN apt-get update && apt-get install --no-install-recommends --yes wget \
      && rm -rf /var/lib/apt/lists/*
RUN wget --no-check-certificate https://apt.puppetlabs.com/puppet7-release-focal.deb && dpkg -i puppet7-release-focal.deb && apt update \
      && apt install puppet-agent -y

COPY entrypoint.sh /entrypoint.sh
RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]
