.PHONY: build upload

all: develop

build:
	jekyll build

develop:
	jekyll build --draft

upload:
	rsync -rvaz _site/* gentux@gentux.io:/home/gentux/www.gentux.io/_site/
