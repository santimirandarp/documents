# How does the Web work? {#general-ideas-about-web-development}

Web development is about building websites. There are 3 main actors:

1.  webpages: data, files.
2.  web server: manages requests, fires responses.
3.  web client (browser): makes http requests, handles responses
    (decompress)

## Browsers I

A webpage is very similar to a text file. As Microsoft Word reads .doc
files, Web Browsers read .html files. Browsers read local files or
request files to the server through a protocol (HTTP). Browsers need an
address, called URL or IP, to find and retrieve the file (website).

A url is composed of many pieces:
`scheme://subdomain.domain.topdomain/folders/file.ext`

scheme is a protocol like http, ftp, and more. Domain is the name of the
site, subdomains are .com, .net, .org. Normally, when we open up a
browser, we use https, and what we type is really the domain name.

Find a [live playground](https://prof3ssorst3v3.github.io/url-parts/)
for url parts.

## The process of seeing a webpage

You open the browser and type a domain name (url). Let\'s see what
happens when we press [Enter]{.kbd}. A request is sent to a DNS server,
to translate the url to an ip address. The ip protocol uses ip addresses
to connect 2 computers: the server and the client. The client is where
the browser is running; the server provides a service, like storing html
files.

Once the computers are linked (in a session), the TCP controls the
transmission of data bit by bit, and HTTP is the high level protocol
dealing with the whole data. The url (ip now) contains also information
about a particular file it is requesting. Then a html file (webpage) or
an error is retrieved and displayed on your screen.

The browser uses the GET method (from the http protocol) to retrieve the
html file. On each GET request a Header and a Body are retrieved (can be
seen on the network tab). When parsing the html file, it may find extra
links to images, or fonts, javascript, so it requests those files too!
Each request adds to the page load-time.

## Browsers II

Once the page is retrieved, many things occur. The Browser generates the
DOM or Document Object Model. This is a tree-like representation of our
HTML document. Each branch is a Node. Nodes are elements, attributes or
text. This structure allows developers manipulate the website using
javascript.
