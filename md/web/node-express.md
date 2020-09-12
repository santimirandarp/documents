# Node.js and Express

Node.js allows us to write backend programs (js files).

Express makes working with node.js easier. 

Express is an npm package (npm i express). An example file:

```javascript
const express = require('express');
const app = express()
```

require package, create an object,  app contain loads of methods.

## Node.js

Node itself is a javascript environment. We're not running 
js in the browser now. We are writing in a file, code that is interpreted/run by node.
(kind of how the terminal is a bash environment).

Basically we edit a file, which is run `node filename` and we see the output below in a terminal.

1. console.log in node.js 
2. retrieve a string using `app.get(path, (a,b) => b.send('string'))`
3. retrieve a file using `app.get(path, (a,b)=> b.sendFile(abspath))`
4. retrieve static assets using `app.use(path, express.static(absP))`
