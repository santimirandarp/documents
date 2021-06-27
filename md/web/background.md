## Properties & Values

-   background-color:color;
-   background-image:url(pathToImg)\|gradients. As per default
    background-size is cover, then this will cover the element.
-   background-size: cover\|contain\|val1 val2. val1 val2 might be
    pixels, %.
-   background-origin: tells where to start \'drawing\' the image.
    Defines the box space.
-   background position: left offset top offset\|options. Tells where to
    position the image in the defined box space (respect to origin). We
    can add offsets (or it\'s 0).
-   background-repeat: repeat (x and y) \|no-repeat\|repeat-x\|repeat-y
-   background-attachment:scroll\|fixed\|local (experimental) scrolls
    with the page, then you see just the initial piece drawn. fixed it
    is fixed to the viewport, so it\'s possible to give it some
    movement.

### Accessibility

-   Overbackground Text must be readable (contrast)
-   Always provide a background-color as a fallback.
-   Do not put content into background images (screen readers).

Multiple Layers is enabled by comma separating values. Last image goes
on bottom.

## Control Of Backgrounds

Backgrounds can be selectively included using media queries.
