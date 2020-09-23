# Basics of Forms

The most common elements:

* Form: Wraps all the form. Attributes: action, method.
* Input: the user types, selects, or uploads data. Type, Placeholder, required, checked, name/value, id.
* Label this is for the user. It binds a piece of text to the for element. Always should use the _for_ attribute to make should the label is understood by SRs.
* Fieldset-legend: to group widgets with the same purpose. Radio buttons should be nested inside a fieldset.
* Textarea
* Button

Most of text-kindof inputs like text, email, url, age, need a name but the value is derived fromt the input itself, when the data is sent. If we give them a value, it's just gonna be a default. 

Similar inputs like checkboxes and radios, need name and value.

Select needs a name, and he value is on the options.

Validation
* Required, 
* min, max, pattern

Related css pseudoclasses: :invalid, :required...


