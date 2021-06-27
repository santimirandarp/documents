const Promise = require('bluebird'); 
const fs = require('fs');
const path = require('path');
const express = require('express')
const app = express()
const marked = require('marked')

Promise.promisifyAll(fs);

const wrapHTML = (title, file) => {
	return `<!DOCTYPE html> 
	<html lang="en">
<head>
<meta charset="utf-8" />
<title>${title}</title>
<link rel="stylesheet" href="/css/index.css" />

<body>
${file}
<script src="/js/index.js"></script>
</body>
</html>
`}
app.get('/', (req,res) => res.sendFile(__dirname+'/index.html'))
app.use( express.static("assets"))
app.get('/md/:topic/:filename', (req, res) => {
  const {topic, filename} =  req.params
  fs.readFileAsync(path.join(__dirname, `/md/${topic}/${filename}`))
		.then((ans)=> {
    const file = marked(ans.toString());
    res.send(wrapHTML("Docs", file))
  });
});

app.listen(3000)
