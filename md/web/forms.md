# Basics of Forms

Form: Wraps all the form. Attributes: action, method. Action is a
redirection, method get or post. Input is the most common form element.
The most important attributes are: type, name and value. Others are:
placeholder, required, etc. It\'s good to know the basic types. The ones
in bold do no need a value attribute (any value given will be a
default).

-   **text, search, email, url, age, textarea**. May be wrapped in a
    label.
-   checkbox, radio. Always wrapped in label.
-   Button
-   select-option. Select needs a name, the value is on the options.

Label this is for the user. It binds a piece of text to the for element.
Always should use the *for* attribute to make should the label is
understood by SRs.

Fieldset-legend: to group widgets with the same purpose. Radio buttons
should be nested inside a fieldset.
