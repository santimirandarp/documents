# CSS basics

-   Best practice: css in external file.

HTML5 controls a webpage\'s **structure** and **semantics**. CSS
controls how the page **looks**.

Syntaxis: `selector {css rules}`. The *selector* targets to an HTML
element (single or group).

## How to Write CSS

[Syntaxis]{.ul}

    selector {property: value;}

[Selectors]{.ul}: .class, #id, tag, attribute value (forms).

[Multiple Classes]{.ul}

        
        <div
        class='className1 className2'>
        Some Random Text<div>
        
        

## Brief

Elements come with custom styling (user agent stylesheet), or inherit a
property, or can be styled using any selector. Inherited props can be
overwritten, assigned props fight with each other and the more specific
wins. If specificity is the same, then source order defines.

## Inheritance and Overwriting

**Some** properties are inherited (passed on from parents to children).
An example is color (with the exception of anchors), fonts (with
exception of input forms), text-align, background. We expect those to be
inherited. On the other hand width, margin, border, padding **are not
inherited**.

### Clashes

            body{color:black;}
            h1 {color:red;} //overwrittes black
            h1>span {color:green;} //overwrittes red
            //What color would a "p"-element text be?    
        

What happens when 2 rules refer to the same HTML element? The algorithm
decides which one to apply. How?

Two concepts matter here:

-   Specificity: [The Rule of 4 places]{.ul}
-   Source Order (aka Cascade): Last rule defined applies.

## CSS and the Browser

Browsers ignore chunks of code they do not understand either
property-value pairs or blocks (if the selector is not understood). DOM
is different to View Source. The browser may correct errors, and modify
the DOM if js is being applied.
