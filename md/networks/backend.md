# What the heck is a web server?

A connection between 2 computers is described as a Client-Server architecture. One computer asks for a service (client), and the other one provides a service (server). The only difference between the computers - apart from the role - is the software they contain. 

A server can be our own computer. A big company server though, are computers with a specific hardware too. Like Xeon processors, RAID disks.

Architecture example: the client use a browser, the server an HTTP-service like Apache or Node-Express.

A finished up server layout: 

{IMAGE full repl}

## Basic instructions

1. set up our normal front-end project
2. install a backend framework 
3. configure 

## Data Journey
To grasp this simple set up we need some context. When a person types a url/domain name, it is requesting a file from a server. The url is the _location_ of a computer. (Over the journey it gets translated to an ip by means of a DNS server). _request_ has a Header and a Body. Together Body and Header bundle all the data the server needs. We think of it as a file.

The file gets to a server (port 80), it handles the file/request. The file says "hey server, I want X resource". And that's where we come in. 

* We will create a function that responds to a particular request.

This happens all the time! Whether we go to _google.com_,  _amazon_ or to a static github page, we request a file, and a server gives receives the request, and retrieves the file (if it exists!). 

## The url
By the way, a domain name is almost synonym or a URL. Example: _https://www.mozilla.org_, _https://www.google.com_

* HTTPS is the scheme/protocol, 
* www is subdomain, 
* amazon, google are domains,
* .com, .org, .net, etc are top domains.

A domain is just a name that maps to a computer IP. Any device in a network has an IP address. At first, we won't bother about domains, and use the ip address. But let me explain further.

### Set Up a Server For Free
1. Local-Local: to access the webpage from devices on the lan (anyone at home).
2. Local-Global: router forwards port 80 requests to our IP (visible to the world, or WAN).

In the first case, it is a lan ip, in the second case what is called a Public ip. In due moment, I will show _how to get that ip_.

People will need to type an ip in the Browser url. (unless we own a domain, see below.) 

### Paying
Or you can buy a domain and optionally rent a host. 

1. Buy a domain + host. They will provide you a computer that you can access remotely with an already set up server. Example: Hostgator.
2. Buy a domain anywhere and then set up the server locally.

Those are rather cheap. What happens here is simple. They link the computer's ip with the domain name, so don't worry about it.

Obviously, we can buy a domain and link it to our local WAN. (I'm yet to know how.)

## Local Area Network Web Server, for free
To get started, we'll do a free local-local server. Our computer will serve a site on the lan. If you have no idea what lan is, just remember this website will only be visible for people connected to the same wi-fi network than you. So probably your family will, but not your neighbors.

### Using Node and Express
1. Install Node.js (for Windows, Mac or Linux)
2. Create a project (using `npm init -y`), or cd into a project.
3. Install express `npm i express`
4. Create a `server.js` file and open it up in an editor. Paste this code in:
```
const express =  require("express")
const app = express()
const port = 3456
console.log("Hello World")
app.listen(port)
```
5. Open a terminal on the server.js directory. And run `node server.js`. 
Now there is a server listening on port 3456. We need to emulate a client. What do clients do?
6. They make requests! In a browser type: _localhost:3456_ 

You will see "can not GET /". That's fine. Let's fix it.

When we type in _localhost_ the browser looks up in the ip 127.0.0.1 which again, is a loopback to our computer. This ip address has no meaning in a different pc (well, it does, it points to that pc!). So there is no danger in showing this ip.

Add this 2 lines to `server.js`

```
const data="Hello Dude"
app.get("/", (req, res)=>res.send(data))
```
You will get a better idea as we roll along.

Re-type `localhost`. You should get the string "Hello Dude".

Now, let's response with a webpage.

```
console.log(__dirname)
//dirname: absolute path to server.js directory.
const pathToFile = __dirname+"/views/index.html"
console.log(pathToFile)
app.get("/", (req,res)=>res.sendFile(path))
```

This will return the file. 

* What happens if you type localhost:3456/a?
* What happens if you change "/" by "/a"? 

Environmental variables are variables Node.js sets when we lauch the program. If you want to check them out, type `console.log(process.env)`. [An intro here](https://www.twilio.com/blog/2017/08/working-with-environment-variables-in-node-js.html). You will notice that is a standard object (we can change it). 

* `localhost:3456/psycopath` will return can not GET. But why?

Essentially, because we're not handling such a request.

### Using Apache in Linux
