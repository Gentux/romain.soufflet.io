---
layout: post
title: "Upgrade Geeksphone Peak to nightly build"
date: 2014-05-02 10:25:54
categories: life firefoxos
---


About a year ago, I left my Nokia N900 phone to buy a Geeksphone device (
<a href="http://www.geeksphone.com/other-devices-2/">Peak<a>). This was hard, very hard… and it still is.

The phone I bought was a developper preview device, I couldn't import contacts from my old device, I couldn't check my
personal calendars through it… etc. But still, I wanted to be part of the FirefoxOS adventure.




1) Make sure you have at least 50% of battery remaining. This is important, because if your phone switch off while updating, maybe you will need to RMA it.
2) With the phone not connected by usb, go to Settings, Device Information, More Information, Developer and check on Remote Debugging.
3)Download http://downloads.geeksphone.com/drivers/usb_driver.zip and unzip it. Remember where you downloaded it, because you will need it later.
4) Use a usb cable to connect it to your computer. If you are using Windows, maybe it will ask for install some drivers. If drivers are not found by Windows Update, you can use the folder that you unzip in step 3.
5) Download the needed image.  Make sure that you download the image needed by your device (keon or peak).
6) Unzip the image in a folder, enter the folder and execute the script. Flash.sh is for Linux, Flash.bat is for Windows and flash_mac.sh is for Machintosh (you need android sdk).
7) Wait until the device reboots and get the First Time Setup.

If you have any problem, post it in the Geeksphone forums or you can directly ping me.
















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
by some odd softwares or by hand from a [ipython](http://ipython.org/) shell.

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
