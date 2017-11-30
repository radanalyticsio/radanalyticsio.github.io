FROM fedora:27

COPY . /srv/site

WORKDIR /srv/site

USER root

RUN dnf group install -y "C Development Tools and Libraries" && \
    dnf install -y ruby-devel libffi-devel gem npm redhat-rpm-config git && \
    gem install bundler && \
    npm install -g bower && \
    bower --allow-root install && \
    bundler install && \
    chown -R 1001:1001 /srv/site

USER 1001

CMD bundler exec jekyll serve -H 0.0.0.0
