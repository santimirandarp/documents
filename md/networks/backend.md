# What the heck is a web server

Just as a quick remainder, a connection between 2 computers is described as a Client-Server architecture. One computer asks for a service (client), and the other one provides a service (server). From a simplistic point of view, the only difference between the computers - besides the role - is the software they contain. 

The client might have a browser, the server an HTTP-service (example: apache, node, ...).

We need to learn how to set up a server, in order for clients to get the service. A server can be our own computer. A big company server though, are computers with a specific hardware too. Like Xeon processors, RAID disks, and so on, and so forth. 

A finished up server layout: 

{IMAGE full repl}

Emulating that set up we should get our server running. Basic steps we will follow are:

1. set up our normal front-end project
2. install a backend framework 
3. configure 

## Data Journey
To grasp this simple set up we need some context. When a person types a url/domain name, it is requesting a file from a server. The urlis the _location_ of a computer. (Over the journey it gets translated to an ip by means of a DNS server). _requests_ have 2 parts: a Header and a Body. The domain is part of the Header (more on this later). Together Body and Header bundle all the data server needs. 

The file gets to the server (to port 80), and because the server is _listening_ on the door (the target url) it handles the file. The file says "hey server, I want X file". And that's where we come in. 

* We will create a function that _returns the requested file_. 
That happens all the time! Whether we go to _google.com_,  _amazon_ or to a static github page, we request a file, and a server gives receives the request, and retrieves the file (if it exists!). 


## The url
You may wonder, but hey, what domain are you talking about? We may get lost here. 

By the way, a domain name is almost synonym or a URL. Example: _https://www.mozilla.org_, _https://www.google.com_

HTTPS is the scheme/protocol then we have subdomain (www) domain (mozilla, google) top domain (org, com).

A domain is just a name just maps to our computer's IP. Any device in a network has an IP address. At first, we won't bother about domains, and use the ip address. But let me explain further.

### Server For Free
1. Local-Local set up: to access the webpage from devices on the lan (anyone at home can access!).
2. Local-Global: set your router to forward port 80 requests to that IP (visible to the world, or WAN).

In both cases the users will need to type an IP. In the first case, it is a lan ip, in the second case what is called a Public ip. In due moment, I will show _how to get that ip_.

Those two options do not need anything like a web domain/url. But people will need to type an ip in the Browser url. 

### Paying
Or you can buy a domain and optionally rent a host. 

1. Buy a domain + host. They will provide you a computer that you can access remotely with an already set up server. Example: Hostgator.
2. Buy a domain anywhere and then set up the server locally.

Those are rather cheap. What happens here is simple. They link the computer's ip with the domain name, so don't worry about it.

Obviously, we can buy a domain and link it to our local WAN. (I'm yet to know how.)


## Local Area Network Web Server, for free
Let's get something running. To get started, we'll do a free, local-local server. Our computer will serve a site on the lan. If you have no idea what lan is, just remember this website will only be visible for people connected to the same wi-fi network than you. So probably your family will, but not your neighbors.

### Using Node and Express
1. Install Node.js (for Windows, Mac or Linux)
2. Create a project (using `npm init -y`), or cd into a project.
3. In any case, install express `npm i express`
Express makes setting up the server very simple. But it could be done with Node alone. 
4. Create a `server.js` file and open it up in an editor. Paste this code in:

```
const express =  require("express")
const app = express()
const port = process.env.PORT || 3000
console.log("Hello World")
app.listen(port)
```
5. Open a terminal on the server.js directory. And run `node server.js`. 
6. (now we "switch to client side) In a browser type: _localhost:3000_

You will see "can not GET". We didn't configure it yet!

When we type in _localhost_ the browser looks up in the ip 127.0.0.1 which again, is a loopback to our computer. This ip address has no meaning in a different pc (well, it does, it points to that pc!) so there is no danger in showing this ip.

Let's serve a string.

Add this 2 lines to `server.js`

```
const data="Hello Dude"
app.get("/", (req, res)=>res.send(data))
//basically app.method("where are they calling to", "what to do")
//method might be get, post, delete, put etc.
```

First argument is where are we expecting the request url, second is a callback.

By typing `localhost`, we're _making a request_ to the root (the directory where server.js is located), and retrieving a string ("Hello Dude").

Let's response with a webpage.

```
//node js defines a variable __dirname, let's test

console.log(__dirname)
// dirname is the absolute path to the current directory.
//we need to append the relative path to the index file
const path = __dirname+"/views/index.html"
console.log(path)
//now let's ask retrieve index.html when they type our webpage "url".
app.get("/", (req,res)=>res.sendFile(path))
```

This will return the file. 

Environmental variables are variables Node.js sets when we lauch the program. If you want to check them out, type `console.log(process.env)` and see the long list of environmental variables. [An intro here](https://www.twilio.com/blog/2017/08/working-with-environment-variables-in-node-js.html). You will notice that is an object. A variable can be logged this way `console.log("My Variable Is", process.env.varName)`

Why is this relevant? Some sites will set a few of this variables for us. In particular the `process.env.PORT`. Be aware!

* What do you think will happen if, instead of localhost, we write `localhost/directory`?

Essentially, this will return not found, because we're not handling such a request.

### Using Apache in Linux
