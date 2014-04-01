.PHONY: build upload

all: build upload

build:
	jekyll

upload:
	rsync -rvaz _site/* gentux@gentux.io:/home/gentux/www.gentux.io/_site/
