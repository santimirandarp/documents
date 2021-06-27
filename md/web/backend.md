# What the heck is a web server?

A connection between 2 computers is described as a Client-Server
architecture. One computer asks for a service (client), and the other
one provides a service (server). The only difference between the
computers - apart from the role - is the software they contain. A web
Client is Firefox, a web Server is an http-service-software like Apache,
Node, Flask. This runs on the server. We now can speak about Client and
Server.

A server can be our own computer. A big company server though, are
computers with a specific hardware too. Like Xeon processors, RAID
disks.

A finished up server layout:

![Example of a backend directory structure and
files](./backend2.jpg "Backend Example")

## Basic instructions

1.  set up our normal front-end project
2.  install a backend framework
3.  configure

## Data Journey

To grasp this simple set up we need some context. When a person types a
url/domain name in a client, it is requesting a file from a server. The
url is the *location* of a device. Over the journey it gets translated
to an IP by means of a DNS server, and so on. But finally reaches (or
not) a server. The *request* has a Header and a Body. Together Body and
Header bundle all the data the server needs. We think of it as a file.

The file gets to a server (port 80, normally), it handles the
file/request. The file says \"hey server, I want X resource\". And
that\'s where we come in.

-   We will create a function that responds to a particular request from
    a client, to a server.

This cycle happens all the time. Whether we go to *google.com*,
*amazon.com* or to a static github page, we request a resource. The
server receives the request, and retrieves the resource (if it exists!).

## Network Tab {#the-url}

When learning about backend programming, we get to understand the full
cycle of the information.

Open up the dev tools. We will find 3 important sections under
**Network** tab:

-   Headers: Contains Response and Request. And many details about the
    URL.
-   Request Body: only contains data when posting to the server (don\'t
    worry for now). But it will be normally empty!
-   Response Body: data retrieved by the server, for example the html
    page, etc.

Of course there is not just one request-response, you may see hundreds
of files, all of those were individual requests. This adds up to the
loading time of the page.

### Brief About URLs

A domain name is a slice of a URL. Example of URLs:
*https://www.mozilla.org*, *https://www.google.com*.

-   HTTPS is the scheme/protocol,
-   www is subdomain,
-   amazon, google are domains,
-   .com, .org, .net, etc are top domains.
-   sub, top, and domain form the base url
-   If we request a page from https://www.mozilla.org/meow the full path
    is called referer.

A sub-domain-top is just a name that maps to a public IP. Any device in
a network has an IP address. At first, we won\'t bother about domains,
and use the ip address. But let me explain further.

## Set Up a Web Server {#set-up-a-server-for-free}

1.  Local-Local: to access the webpage from devices on the lan (anyone
    at home).
2.  Local-Global: router forwards port 80 requests to our IP (visible to
    the world, or WAN).

In the first case, it is a lan ip, in the second case what is called a
Public ip. In due moment, I will show *how to get that ip*.

People will need to type an ip in the Browser url. (unless we own a
domain, see below.)

### Or Paying {#paying}

Or you can buy a domain and optionally rent a host.

1.  Buy a domain + host. They will provide you a computer that you can
    access remotely with an already set up server. Example: Hostgator.
2.  Buy a domain anywhere and then set up the server locally.

Those are rather cheap. What happens here is simple. They link the
computer\'s ip with the domain name, so don\'t worry about it.

Obviously, we can buy a domain and link it to our local WAN. (I\'m yet
to know how.)

### Local Area Network Web Server, for free

To get started, we\'ll do a free local-local server. Our computer will
serve a site on the lan. If you have no idea what lan is, just remember
this website will only be visible for people connected to the same wi-fi
network than you. So probably your family will, but not your neighbors.

## Real Case: Server Using Node & Express {#using-node-and-express}

1.  Install Node.js (for Windows, Mac or Linux)

2.  Create a project (using `npm init -y`), or cd into a project.

3.  Install express `npm i express`

4.  Create a `server.js` file and open it up in an editor. Paste this
    code in:

                const express =  require("express")
                const app = express()
                const port = 3456
                console.log("Hello World")
                app.listen(port)
                

5.  Open a terminal on the server.js directory, and run
    `node server.js`.

6.  Clients make requests. In a browser type: *localhost:3456*

You will see \"can not GET /\". That\'s fine. When we -as clients-
request a route that is not handled by the server, it returns that
message. Let\'s fix it.

When we type in *localhost* the browser looks up in the ip 127.0.0.1
which again, is a loopback to our computer. This ip address has no
meaning in a different pc (well, it does, it points to that pc!). So
there is no danger in showing this ip.

We can also use our local IP. Instead of being only accessible from our
computer (as the loopback address) our local IP is a number with meaning
on the Local Area Network. You can find your local IP using ipconfig
(Windows) ifconfig (Linux). In my case it is 192.168.1.25. Then, anyone
(on the lan) can access the typing **your** local IP address on the
browser url bar.

But let\'s improve our server.

Add this 2 lines to `server.js`

        const data="Hello Dude"
        app.get("/", (req, res)=>res.send(data))
        

You will get a better idea as we roll along.

Re-type `localhost` or your local IP. You should get the string \"Hello
Dude\".

Now, let\'s response with a webpage.

        console.log(__dirname)
        //dirname: absolute path to server.js directory.
        const pathToFile = __dirname+"/views/index.html"
        console.log(pathToFile)
        app.get("/", (req,res)=>res.sendFile(path))
        

This will return the file.

-   What happens if you type localhost:3456/a?
-   What happens if you change \"/\" by \"/a\"?

Environmental variables are variables Node.js sets when we lauch the
program. If you want to check them out, type `console.log(process.env)`.
[An intro
here](https://www.twilio.com/blog/2017/08/working-with-environment-variables-in-node-js.html).
You will notice that is a standard object (we can change it).

-   `localhost:3456/psycopath` will return can not GET. But why?

Essentially, because we\'re not handling such a request.

### So we now have a server

In the previous section we set up a server. Which is a computer that
handles requests from clients. To make a request, clients need an IP (or
a domain name, once we buy one).

### Using Apache in Linux

## Websockets

Conceptually, an http server handles a request, and it\'s all done. What
does it mean? If there are changes on the server, nothing change in the
client, unless they make a new request. With websockets, the server is
allowed to push changes to clients. For example, we can build a chat
app, or just send any particular change to the html page.
