.PHONY: build upload

all: develop

build:
	jekyll build

develop:
	jekyll build --draft

upload:
	rsync -rvaz _site/* gentux@server:perso/romain.soufflet.io/_site/
