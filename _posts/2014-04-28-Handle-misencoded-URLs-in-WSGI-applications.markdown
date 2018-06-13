---
categories: python wsgi
custom_css: posts.css
date: 2014-04-28 17:12:02
img: https://s3.eu-west-2.amazonaws.com/gentux/Images/languages.jpg
layout: post
language: en
public: yes
title: "Reject badly encoded request in Python WSGI applications"
---

At [Easter-eggs](http://www.easter-eggs.com/) we use [Python](http://www.python.org/) and
[WSGI](http://wsgi.readthedocs.org/en/latest/) for web applications development.

The last few months some of our applications crashed periodically. Thanks to
[WebError ErrorMiddleware](https://github.com/Pylons/weberror), we receive an email each time an internal server error
occurs.

For example someone tried to retrieve all of our [french territories data](http://ou.comarquage.fr) with the API.

The problem is simple: when the request headers contains non UTF-8 characters, the [WebOb](http://webob.org/)
[Request](http://docs.webob.org/en/latest/modules/webob.html) object throws an **UnicodeDecodeError** exception because
it expects the headers to be encoded in UTF-8.

End-user tools like web browsers generate valid UTF-8 requests with no effort, but non UTF-8 requests can be generated
by some odd software or by hand from a [ipython](http://ipython.org/) shell.

Let's dive into the problem in ipython :

    In [1]: url = u'http://www.easter-eggs.com/é'

    In [2]: url
    Out[2]: u'http://www.easter-eggs.com/\xe9'

    In [3]: url.encode('utf-8')
    Out[3]: 'http://www.easter-eggs.com/\xc3\xa9'

    In [4]: latin1_url = url.encode('latin1')
    Out[4]: 'http://www.easter-eggs.com/\xe9'

    In [5]: latin1_url.decode('utf-8')
    [... skipped ...]
    UnicodeDecodeError: 'utf8' codec can't decode byte 0xe9 in position 27: unexpected end of data

This shows that U+00E9 is the Unicode codepoint for the **'é'** character (
[see Wikipedia](http://en.wikipedia.org/wiki/%C3%89#Character_mappings)), that its UTF-8 encoding are the 2 bytes
**'\xc3\xa9'**, and that decoding in UTF-8 a latin1 byte throws an error.

The stack trace attached to the error e-mails helped us to find that the **UnicodeDecodeError** exception occurs when
calling one of these **Request** methods: **path_info**, **script_name** and **params**.

So we wrote a new WSGI middleware to reject mis-encoded requests, returning a bad request HTTP error code to the client.

    from webob.dec import wsgify
    import webob.exc


    @wsgify.middleware
    def reject_misencoded_requests(req, app, exception_class=None):
        """WSGI middleware that returns an HTTP error (bad request by default) if the request attributes
        are not encoded in UTF-8.
        """
        if exception_class is None:
            exception_class = webob.exc.HTTPBadRequest
        try:
            req.path_info
            req.script_name
            req.params
        except UnicodeDecodeError:
            return exception_class(u'The request URL and its parameters must be encoded in UTF-8.')
        return req.get_response(app)

The source code of this middleware is published on Gitorious:
[reject-misencoded-requests](https://gitorious.org/wsgi-bricks/reject-misencoded-requests/)

We could have guessed the encoding, and set the **Request.encoding** attribute, but it would have fixed only the read
of **PATH_INFO** and **SCRIPT_NAME**, and not the **POST** and **GET** parameters which are expected to be encoded only
in UTF-8.

That's why we simply return a 400 bad request HTTP code to our users. This is simpler and does the work.
