# Basics about Anchors

## Brief

Adapted from HTML [docs
Mozilla](https://developer.mozilla.org/en-US/docs/Web/HTML "
Introduction to HTML") licensed under CC-BY-SA2.5.

**Use relative paths**
:   relative (local) paths reduce number of GETs plus make code reading
    easier.

**Meaningful Text**
:   meaningful hypertext for SEO and reading / hearing.

**Link to elements**
:   link to section of a different HTML by the url plus #sectionId.

**Improve URL**\
:   *index.html* simplify the URL shown to the users.

## Anchors\' Attributes

Frequent attributes:

-   href, target, title
-   download: \<a href=\'file.extension\' download=\'nicename.ext\'\>
    good text \<a>

### Extended Discussion

**href** accepts relative paths (relative to *index.html*\'s folder) and
absolute paths (full url to specify a computer plus a path to the file.)
HTTP protocol allows to access files in a different computer called
server, plus some post processing.

**target** has two main values: \_self or \_blank. *self* opens up the
reference on the same window, *blank* does it on a new tab. `download`
only works for same origin URLs, this is, relative paths (in the same
computer i.e server.)

`[title]` attribute is available in many other elements. This won\'t
help for SR, phones, tablets.

#### A concrete example

Example for local and full paths


    <a href="./about.html" 
    title="Opens a new tab on the about page for this website" 
    target="_blank">Go to About Page</a>

    <a
    href="https://domain.com/path/to/file"
    title=" lubuntu 20.04 will start downloading with the name: lubuntu.iso"
    target="_self" download="lubuntu.iso">Download Lubuntu 20.04 64-bits
    iso (opens on current window).</a>

## How to write nice and useful URLs

### Clean URL

Would you like to display *baseurl/about* instead of
*baseurl/about.html*? Then read on.

#### Example

Suppose on the project folder there are all html files: **index.html**,
**about.html**, **whatever.html**. Now we make new directories named:
about, whatever. Next we put about.html under *about* directory and
rename the file **about.html** → **index.html**. Follow the same
procedure with each file.

On the main index.html file we link to about as `href="about"` and
analogous for the remaining files. When you click on *about* the browser
will display a nicer url.

### Linking to a section of any HTML page

Elements with an id as in


    <section 
    id="idName">
    content <section/>

can be linked in an anchor\'s href too, just using
`href='/path/to/file#idName'`. `/path/to/file` should be omitted for a
section in the same document (as we are already there.)

### Encoding

URLs have to be ASCII encoded, otherwise, the browser handles the
conversion using %0F, hexadecimal chars. For example the space is
converted to %20 or + .

In this sense, you don\'t want filenames with spaces or non-ascii
characters. If you do, the browser will modify it and probably won\'t
look good, trusty or professional.

Something similar happens for mails:

`[href]='mailto:'`

[Send mail with cc, bcc, subject and
body](mailto:nowhere@mozilla.org?cc=name2@rapidtables.com&bcc=name3@rapidtables.com&subject=The%20subject%20of%20the%20email&body=The%20body%20of%20the%20email)
because any parameter on the href is part of the URL, which is ascii
encoded.

-   Spaces percent-escaped `%20`
-   finish recipient using question mark `?`
-   end mail field using ampersand &
