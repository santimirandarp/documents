# Units and Fonts

## Units

Units

pixels, cm, mm, viewports, rem v em

pixels are literally the small pieces composing the screen, physical
units: px, cm, mm, inches. viewports % of the browser\'s window em:units
relative to the first parent element with specified pixels or physical
units. Otherwiseto body or html. rem: root em. Relative to the html
(root) tag. The default is usually 16px.

### REM v EM

change html {font-size: N px;}. All elements with *REM* = root em will
resize accordingly. *em* is relative to nearest parent element size. If
only *em* is used, then the result is equivalent to that of *rem*.

There are still [problems in
IE9](https://www.w3schools.com/css/css_font.asp "problem in IE9").
adding

## Fonts

There are generally three types of sites where you can obtain fonts:

-   An online font service: This is a site that **stores** and serves
    the fonts for you.
-   Free download (there may still be some license conditions).
    Examples: Font Squirrel, dafont, and Everything Fonts. In this case
    we store the font locally. And then on our server.
-   A paid font distributor.

### Font Squirrel, dafont

We download a font in otf or ttf, and although those are webfonts, it\'s
recommended (w3c) to use woff. We can convert it using font squirrel
too. And there are free tools also (I use a github repo). Font Squirrel
web-font (woff) generator is light years better. (it retrieves even the
bulletproof css).

Advanced topics: unicode range, stretch, etc. Also Variable Fonts seems
to be interesting.

### Google Fonts

Easy to use. Download or Link in html or css.

### Web Safe Fonts

There are also fonts normally available in any OS, and those can be
included as fallback

### Variable Fonts

### Fonts Brief

Download fonts from anywhere as long as the license is fine. Then upload
to font squirrel and voala, we get them forever. Even to use as system
font.

The other good option is google fonts.
