.PHONY: build upload

all: build upload

build:
	jekyll build

upload:
	rsync -v _site/* gentux@gentux.io:/home/gentux/www.gentux.io/
