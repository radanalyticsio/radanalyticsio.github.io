FROM jekyll/jekyll

ADD . /srv/jekyll

RUN gem install bundler && bundle install

CMD bundle exec jekyll serve
