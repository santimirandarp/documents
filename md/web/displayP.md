# Display Property & Floats {#display-property}

Any element in a page is either a block, inline-block or inline.

## Block Element

-   Blocks are boxes. Starts on a new line, fills parent width, has a
    line end (\\n).
-   Centering. If width less than 100% `margin:0 auto;` h-centers the
    block on its parent container. **Note**: it has no effect if the
    width is not set (or is set to 100%).

## Inline-Block Element

-   Inline-blocks don\'t start on a new line. Cover just width+padding.
    Do not end a line (\\n).
-   Blocks behavior: wrap completely or do not wrap at all.
-   \<img> and \<a> are inline-block elements, the display can be
    modified.

### More values for display

More values for display are inline and none. None is close to
visibility:hidden, but here the space remains, and the content does not
dissapear from the DOM.

## Floats

Floated elements floats on its parent element. We tell this by using
`float:none|right|left|inherit;`. `float: none;` is the default value.

## Inner and Outer display

-   **Inner:** changes the way direct children behave. Ex: flex, grid,
    table
-   **Outer:** changes the element\'s itself display. inline, block,
    inline-block.

Both can be specified sometimes. Example display:inline-flex; will set a
inline outer display and flex inner display (for its children). Remember
that even though we can change the display, the real display is not
changed. And so as block inside inlines is not allowed, an anchor with
display:block won\'t be able to contain a paragraph or might cause
conflicts at some point. **Do not put blocks inside inline elements.**

## Size of Elements

-   When there is no content default height is 0.
-   Padding and Margin dimensions % values are relative to the width
    (inline size), always.
-   This is why padding:10%, or margin:15% give a \'square feeling\'.
-   We can now change height to vh units and make it change with
    viewport\'s height.

## Box Sizing

      html {
        box-sizing: border-box;
      }
      *, *::before, *::after {
        box-sizing: inherit;
      }
        

h & w do are not props for inline elements. Though pbm do applies.

## Position

[Syntaxys]{.ul} `selector{position:value;}`

[Values]{.ul} relative, absolute, fixed, sticky, static.

[Offset]{.ul} top, bottom, right and left offsets.

### Common Values {#a-bit-more-}

-   Static: default.
-   Relative: to the position in the normal flow. \~ removes the element
    from normal flow (element not ignored)
-   Absolute: respect to body or first relative positioned parent.
    [Removes element from normal flow.]{.ul}
-   Fixed: is absolute positioning relative to the browser window
-   Sticky: fixed on the parent element.
-   Float: right or left.

Normal flow is the arrange of elements without using position abs or
float.

> When setting float:x or position:absolute, the rest of the elements
> ignore these elements but not in the same way. **For floated elements
> the space is still reserved.**

### More on Floats {#float}

It makes the floated element *boyar* around other element. It\'s very
useful for images and sidebars.

Flex and Grids are interesting variants to flots with a nicer behaviour
and properties.

### Issues

If inside a container, container\'s height will be zero. Try: write a
background color. It will stay the same.

### Solutions

To the parent:

-   overflow:hidden; (automatically measures childs\' height).

Also elements can be cleared

## Overflow

Overflow: xval yval \| both \[scroll (scroll bars always, visible,
hidden, auto (scroll only if necessary)\] change the font size from the
browser (or body) to check if it still works properly there. Why
overflow visible is default? Because CSS tries to minimize data loss.
Also, you or your readers may not notice something missed if overflow is
hidden.

## How to center

-   Use position absolute in element, and position relative in the
    parent element.
-   [Use flexbox.](flex.html)
-   Use even paddings
-   Use grids
-   Use margin auto to center horizontally or align center
-   one liners Line height/vertical align and aligr center also works
    fine.
