# Vendor Scripts
We know how to include own scripts, even modules.

But scripts we download from npm may not be prepared to be included.

Sometimes we can just download npm package, and link the file to the browser, or some packages 
provide a cdn, this is, a file coming from a server, that we can link.

Another option would be to use webpack o browserify (simpler):

1. Install browserify with `npm i browserify`

2. run `npm browserify infile.js outfile.js`

3. Link outfile.js in the script tags and the code will run.


