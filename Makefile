.PHONY: build upload

all: build upload

build:
	jekyll build

upload:
	scp -r _site/* gentux@gentux.io:/home/gentux/www.gentux.io/
