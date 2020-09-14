# What the heck is a web server
Let's take a finished web server. 

Just as a quick remainder, any connection between 2 computers is described as a Client-Server architecture. One computer asks for a service (client), and the other one provides a service (server). From a simplistic point of view, the only difference between the computers -besides the role- is the software they contain. 

The client might have a browser, the server an HTTP-service (example: apache).

So we need to learn how to set up and configure a server, in order for clients to ask for services. A server can be our own computer. A big company server though, are computers with a specific hardware too. Like Xeon processors, RAID disks, and so on, and so forth. 

{IMAGE}

Emulating that set up we should get our server running. What is the trick then?

1. set up our normal front-end project
2. install any backend framework (example: express)
3. configure express

To grasp this simple set up we need some context. When a person types a url, it is requesting a file from somewhere. The urlis the _location_ of a computer. (Over the journey it gets translated to an ip by means of a DNS server). That _request_ is a parent file, a piece of data. It has 2 parts, a Header and a Body. The url is part of the Header (more on this later). Together Body and Header bundle all the data server needs. 

The file gets to the server (to port 80), and because the server is _listening_ on the door (the target url) it handles the file. The file says "hey server, I want X file". And that's where we come in. 

We need to create a simple function that _returns the requested file_. That happens all the time! Whether we go to _google.com_,  _amazon_ or to a static github page, we request a file, and a server gives receives the request, and retrieves the file (if it exists!). On the following image, you can see part of the code, the file structure, and the page we are requesting to the server through the url.

{IMAGE 2}

## The url
You may wonder, but hey, what url you talking about? I am a newcomer, I don't even know much about that. We may get lost here. Luckily, we don't need one at first; and I will explain how to get one anyways. 

Remember, we need to set up a server. For that, we need to create a function that reads that "files" that the Client is requesting. There are a couple of ways to set up a server _without buying_ a url/domain name.  

By the way, a domain name is almost synonym or a URL. Example: _https://www.mozilla.org_, _https://www.google.com_

HTTPS is the scheme/protocol then we have subdomain (www) domain (mozilla, google) top domain (org, com).

## For Free
1. Local-Local set up: to access the webpage from devices on the lan (anyone at home can access!).
2. Local-Global: set your router to forward port 80 requests to that IP (visible to the world, or WAN).

In both cases the users will need to type an IP. In the first case, it is a lan ip, in the second case what is called a Public ip. In due moment, I will show _how to get that ip_.

Those two options do not need anything like a web domain/url. But people will need to type an ip in the Browser url. 

## Paying
Or you can buy a domain and optionally rent a host. 

1. Buy a domain + host sites like Hostgator (15 dollars/month the cheapest way). They will provide you a computer that you can access remotely with an already set up server.
2. Buy a domain anywhere and then set up the server locally.

Each option is not free, but they are rather cheap. What happens here is rather simple. When you buy a domain and a host, they will ask you for the domain, and they set up things in a certain way. They link the computer's ip with the domain name.

Obviously, we can buy a domain and link it to our local WAN. (I'm yet to know how.)

But this is too much. To get started, let's make a free, local-local server. Our computer will be a LAN (local area network) server.

## Local Area Network Web Server

### Using Node and Express

### Using Apache in Linux
