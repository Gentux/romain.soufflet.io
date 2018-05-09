# Personal website

This is my personal websites.
You can visit it at [romain.soufflet.io](https://romain.soufflet.io/)


This site is powered by [Jekyll](http://jekyllrb.com/)


# Build a local version

```
docker run \
  --rm \
  --volume="${PWD}:/srv/jekyll" \
  --volume="${PWD}/vendor/bundle:/usr/local/bundle" \
  -it jekyll/jekyll \
  jekyll build
```

You can start a simple webserver to serve the content of `_site` directory

```
docker run \
  --port 80:8000 \
  --name romain.soufflet.io \
  --volume ${PWD}/_site:/usr/share/nginx/html:ro
  -d nginx
```

And access it on http://localhost:8000
