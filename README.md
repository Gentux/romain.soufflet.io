# Personal website

[![Netlify Status](https://api.netlify.com/api/v1/badges/8ebe26c2-bb55-46d1-81e8-a87285ebb4f1/deploy-status)](https://app.netlify.com/projects/romainsoufflet/deploys)

This is my personal websites.
You can visit it at [romain.soufflet.io](https://romain.soufflet.io/)


This site is powered by [Jekyll](https://jekyllrb.com/)


# Build a local version

```
docker build -t romain-soufflet-jekyll-watch .
docker run \
   --rm \
   --volume="${PWD}:/srv/jekyll" \
   --name romain.soufflet.io-jekyll-watch \
   -dt romain-soufflet-jekyll-watch
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
