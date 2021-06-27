::: {role="main"}
::: {style="text-align:center;"}
# Images

Loading, Best Practices, Theory
:::

## Brief

Store locally, use **alt** attribute, width and height whenever
possible. Background-images for non-content/decorative images.

## Loading

In the most straightforward approach images can be loaded using

`<img src='path/to/images/sourceImage.format'>`

## Best Practices

On Storage
:   Store under */images* folder. Also use *descriptive_filename*. This
    optimizes SEO (and we get more views).
:   Store Locally, i.e on the same server than the website, and avoid
    using external urls. Use external links is prone to links breaks or
    modified images. Also a DNS search + GET takes more time to load the
    image.
:   If an external image is used, be it on the public domain. example
    picsum.photos/h/w?random

Use `alt` attribute. Text is useful for users with:
:   impaired vision
:   turned off images (ex. in many phones)
:   text-only browsers as Lynx
:   search engines

Background-image
:   When images do not add to the content use background images. Also
    those do not need to be described (as with alt).
:   if really need to include decorative \<img> use alt=\'\'

### About the *alt* attribute

-   alt attribute is required for validation (use html validator)
-   images inside links add border:0 (to prevent IE9 and earlier of
    displaying a border)

## Displaying (or not) Images

One solution (probably not implemented in all browsers) is to include
inline height and width and also any kind of css to make it responsive.
If the image fails loading, a proper space will be shown.

It works like this: browsers use width and height to calculate a ratio,
and that\'s gonna be used into the css, and will always look fine.
Height has to be auto.

### A few advices

-   width and height to avoid flickering and reserve space
-   The **figure** element can be used for set of different images (art
    direction)
-   Minify the images to reduce load time + data-transfer.

## srcset and sizes attributes

In the bare minimum and image loading should look like this:
`<img alt='description' width='300' height='400' src='path/to/images/pic' &bg;`

Common computer-screen resolutions are 72dpi. An image should be
displayed on its **natural size** (area covered by its number of
pixels). Why? Too big sizes make it grainy, too small (if too small)
waste bandwidth and increase load time. It\'s ok to strech/shrink but
avoiding extremes. *srcset* attribute allows us to include more than one
image.

This is where srcset attribute comes into play. We specify filename and
its intrinsic width in pixels **but using w** like so:

              < img srcset="elva-fairy-480w.jpg 480w,
                elva-fairy-800w.jpg 800w"
                src="elva-fairy-800w.jpg" alt="Elva dressed as a fairy">
              
          

It loads 480 for small viewports, 800 for bigger ones. Because the size
(of the slot) as per default is 100vw.

But let\'s say the 480w want to be displayed for less than 600px
devices. We can use sizes with a media query and a slot width:

              < img srcset="elva-fairy-480w.jpg 480w,
                elva-fairy-800w.jpg 800w"
                sizes="(max-width: 600px) 480px,
                800px"
                src="elva-fairy-800w.jpg" alt="Elva dressed as a fairy" >
              
          

So the browser look which image fills the slot.

In different density devices, it says something like this: we need to
fill 480vw then if the pixel density is 2 480w is not enough because
there are 960 pixels. The best choice here is 800w.

So pixel density acts selecting an image from the srcset after
multiplying it by the density

From MDN:

> So, with these attributes in place, the browser will:
>
> -   Look at its device width
> -   Work out which media condition in the sizes list is the first one
>     to be true
> -   Look at the slot size given to that media query
> -   Load the image referenced in the srcset list that most closely
>     matches the chosen slot size

### Tip

Always specify the width when using sizes attribute or the image will
take the sizes\' slot size.

## Example Case

Let\'s say we want to upload a 1500px square image, and make it
available for retina displays and responsive.

We could `.image {width:100%; /*height:auto; is default*/}` for
responsiveness. But yet it loses resolution when stretching out or
wastes bandwidth when shrinking in. We can add *srcset* and upload diff
sizes for different densities.

## Control Of Backgrounds

Backgrounds can be selectively included using media queries.

To check which images are loaded (transferred from the server) always
look at the network monitor tab in the dev tools

## Object Fit

Let\'s say we want an image fill a 200x150 pixel box. It\'s probably
more useful with vw, vh. If we do `.parent{width:200px; height:150px;}`
and `.img{width:100%; height:100%}` it solves the issue but the image\'s
aspect ratio is probably changed. A solution is to use
object-fit:cover\|contain. The values being self-explanatory.

The previous example is fixed like:

          
    .parent{width:200px; height:150px;}
    .img{width:100%; height:100%; object-fit:cover;}
          
          

And \*This is Important\* the width,height values are absolutely
necessary (it doesn\'t take effect otherwise.)

Replaced Elements behave different in grid and flex layouts. They don\'t
stretch as per default. They are aligned to the start. They could be
stretched using the next css though.

          
          img { width: 100%; height: 100%; }
          
          

But this changes the aspect ratio, so we could add object-fit!
:::
