FROM radanalyticsio/radanalytics-io-base

COPY . /srv/site

WORKDIR /srv/site

USER root

RUN bower --allow-root install && \
    bundler install

USER 1001

CMD bundler exec jekyll serve -H 0.0.0.0
