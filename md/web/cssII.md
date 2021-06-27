# CSS II {#css-level-2}

## Brief

\* and all. Combinators, pseudoelements, pseudoclasses.

## Universal Selector & All property {#universal-selector}

The Star ( \* ) selects each elements\' property. all selects all
properties from one element. Used for **resets**.

## Combinators

-   descendant *body p*
-   general sibling *p \~ p* (siblings: under same parent)
-   adjacent sibling *li + li* (li that is after an li).
-   direct children *ul>li*

## Pseudoelements

[Syntaxis]{.ul} selector::PE {code}

[Example]{.ul}

      
      h1::after {content: " "; /*or */
      content:"url{img} }
      
        

[Specificity]{.ul} same than elements.

### And they are\... {#and-they-are-}

-   first-line, first-letter
-   before, after
-   selection

Single colon also works, for cc1 & 2 compatibility.

**before, after** insert content before/after an element\'s content.

**selection** applies to the selection made by a user. Can be applied to
color, background, cursor, outline.

## Pseudoclass

[Syntaxis]{.ul} selector:PC {code}

[Example]{.ul} p:first-child {code}

[Specificity]{.ul} same than classes.

-   :focus useful for input text or area.
-   :hover :visited :active
-   :first-child :last-child :nth-child
-   p:last-of-type (all elements last ps on any parent)
-   :not(selector) selects all that is not selector !

```{=html}
<!-- -->
```
      p {
        display: none;
        background-color: yellow;
        padding: 20px;
        }
      div:hover p {
        background-color:red;
        }
        

When the div is hovered, it sets the display property of the paragraph.

Keep in mind that hovering is useless for phones and other devices.

## Transform

-   Scale,
-   Rotate,
-   Translate,
-   Skew.

Transforms are animatable

## Forms

There is incompatibility on browser styling and also usually forms do
not inherit font, etc, etc. So a few resets can be found elsewhere or
just use normalize (a popular stylesheet).

## Organizing css

Styling Methods
:   OOCSS (good for small projects),
:   BEM (much effort for a small project).

Preprocessors
:   SASS,LESS

PostProcessors
:   cssnano (compress the file).
