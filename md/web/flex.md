::: {role="main"}
# Flexbox

::: {.section title="parent elements"}
## The Container

Default values displayed first

1.  flex-direction:row\[-reverse\]\|column\[-reverse\];
2.  flex-wrap:nowrap\|wrap;
3.  flex-flow combines previous 2. Example flex-flow:row wrap;
4.  align-items:stretch\|baseline\|more values
5.  justify-content:center\|more values
6.  align-content:space-around\|more velues. It\'s for the **flex
    lines** (rows or columns)

Default style distribute whole width according to the amount of content
(text). **I\'m a fat paragraph, give me more space!**

The reason for this is the default value of flex-basis:auto as well as
flex-grow:0. Using flex-grow 1 and minmax() the children could look
good.

All elements, by default, stretch to the tallest element\'s height.

### Perfect Centering

This beauty centers a single child on the parent (container) vertically
and horizontally:

                    
                        .flex-container {
                            display: flex;
                            height: 300px;
                            justify-content: center;
                            align-items: center;
                          }
                    
                
:::

::: {.section title="child elements"}
## Direct Children

Any element inside a flex container should be thought as a flex item and
not as an actual element.

The items properties are:

-   order. Use order:number. Same numbers go in document order.
-   flex-grow:0\|any number. extra space fraction for item will occupy
-   flex-shrink:1\|any number. how to shrink if they don\'t fit.
-   flex-basis:initial length
-   flex: flex-basis flex-grow flex-shrink. Example default: flex: auto
    0 1;
-   align-self: overrides align-items.

This same idea that any direct children of a flex container becomes a
*flex item* also applies to grids. As extracted from
[W3.schools](https://www.w3schools.com/css/css_grid.asp)

> All direct children of a the grid container automatically become *grid
> items*
:::

::: section
## Auto and Fraction

It\'s important to understand common values like *auto* and *fr*s

*Auto* pushes width relative to amount of content. Once this is yield,
the remaining space is distributed evenly. In a set of steps it would
be:

1.  Shrink children to minimum width
2.  Evaluates: is there more content? Yes, then increase size. No, then
    keep it small.
3.  If the content fits on the container, then distributes the remaining
    space evely

Instead of adding more space on the more populated item, it restricts
the width relative (fraction) to the width of the container.

The difference pops in when there are elements with *less* content.
Using *frs* the step two increases size of all elements.
:::
:::
