#!/bin/bash

set -x

gem sources --remove https://rubygems.org/
gem sources --remove http://rubygems.org/

gem sources -c
gem sources --add 'http://forge.dsic.minint.fr/nexus/repository/rubygems-org/' --no-http-proxy

gem install kramdown
gem install jekyll
gem install jekyll-watch

jekyll build --watch
