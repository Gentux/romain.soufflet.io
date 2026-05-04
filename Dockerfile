FROM jekyll/jekyll

RUN \
  gem install kramdown && \
  gem install jekyll && \
  gem install jekyll-watch

VOLUME [ "/srv/jekyll" ]
WORKDIR /srv/jekyll

ENTRYPOINT [ "jekyll", "build", "--watch" ]
