# Personal website

This is my personal websites.
You can visit it at [romain.soufflet.io](https://romain.soufflet.io/)


This site is powered by [Jekyll](https://jekyllrb.com/)


# Build a local version

```
docker run \
  --rm \
  --volume="${PWD}:/srv/jekyll" \
  --name jekyll_watch \
  -dt jekyll/jekyll \
  ./start.sh
```

You can start a simple webserver to serve the content of `_site` directory

```
docker run \
  -p 9000:80 \
  --name romain.soufflet.io \
  --volume ${PWD}/_site:/usr/share/nginx/html:ro \
  -d nginx
```

And access it on http://localhost:9000
