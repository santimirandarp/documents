# RCC: React Core Concepts.

> Break the UI into basic, meaningful parts. Those become your Components.

## Mixing HTML and JS

- We write normal HTML as a return value of functions. 
- In the HTML write any JS but between  { js here }. 
- Out of the HTML tags write normal js.


### HTML differences
- All attributes are camelCase. className, onClick.
to render a component.

**Example**
```javascript
from react import React
from react-dom import ReactDOM;
const insertThis  = "but good"
const JSX = (<div id="myDiv"><h1 className="reddish"> The little {insertThis} document</h1></div>)
ReactDOM.render(JSX, document.getElementById("root")) 
```
_const JSX_ is assigned to this native react notation, JSX.

### React's Flow

1. Runs all js
2. Turns components into html
3. Puts the result into the html document.

## Components

_JSX_ code can be created using variables, functions or classes. The last 2 are called Components. Functions are **stateless functional components**; Classes can be stateless or stateful. Stateful components define `this.state = {}` in the `constructor()` of the class. More on it in later.

* Components can be exported and imported as normal javascript. 

Class components are classes. Clases contain a `constructor`, and inside an optional `super`, to the constructor of the parent component. It's equivalent to setting a prototype using constructors.

## Render 
Any element with id. Example ReactDOM.render(<Component/>, getElementById("id")>. We can run React in the whole site or just parts.

## Import Export

```javascript
//child.js
import React from react
function Component(){
let JSX = <ul><li>Mooae</li><li>Ha Ha</li></ul>
return JSX
}
default export Component
```
```javascript
//parent.js
import React from react
import Component from './child'

function ParentComponent(){
let JSX = <div><p>Parent</p><Component/></div>
}
```
------------------------------------------

## PROPERTIES

No easier way than an example. For functional components:

```javascript
function Name(props){
return (<ul><li>props.value</li></ul>)
}
<Name key={value}/>
```
Any other parameter in the invocation `<Name key1={val1} key2={val2}/>`
will be passed as `props = {key1:val1, key:val2}`

The actual name 'props' is irrelevant. if we write `Name(julioCessar){...julioCessar.key}` it will be the same. It's just a best practice.

For class components the _invocation is the same_ but inside the class we use:

```javascript
class Name{
constructor(){
super()
...
}
render(){return <a href='hi.com'/>this.props.key1</a>}
}
```

## States

* When react detects that `this.state` has changed, it re-renders the component.
* State shouldn't be modified as: this.state.key = 'new value'
* State should be modified using setState({new state here})
* Onle the **initial value** of state is given in the constructor.
```javascript
class MyStatefulComponent extends React.Component{
    constructor(props){
        super(props);
        this.state = { posts:"allpostsHere"}
    }
    render() {
    const myposts = this.state.posts
    const JSX=(<div>
                <h2>New Posts</h2>
                <ul><li> We can render all posts like this: {this.state.posts}</li>
                <li> Or we can render like this {myposts}</li>
                <li>Second method pollutes less the markup</li>
                </ul>
                </div>)
                return JSX
    }
}
```

* Stateless functions and stateless components just do not have this 'state' object. 

* We pass state from parent to children using props (couldn't be easier).

-------------------------

From reactjs.org:

* Extracting components might seem like grunt work at first, but having a palette of reusable components pays off in larger apps. A good rule of thumb is that if a part of your UI is used several times (Button, Panel, Avatar), or is complex enough on its own (App, FeedStory, Comment), it is a good candidate to be extracted to a separate component.

* The only place where you can assign this.state is the constructor.
This implies that setState({prop:this.state...}) is wrong and that `let this.state  = this.state + 1` is also wrong. So now we now how to use state.

React Core Concepts
* Top Level Stateful component, and then functional, stateless children.
* Parent affects child by passing state through props
* A method defined in the parent is inherited to children (class' body =  prototype) 
* A parent's method can be invoked in the children to change parent's state ( are those the famous 'callbacks?').
* A method in the children is invoked just using the method's name. Example <Child onClick={this.handleClick}/>
* An example that is not an event handler is <Child electroprop={this.electrofn}/> and then using this.prop in class components or just props.electronprop(parameters) to the functional component.
* for methods == normal functions, binding is necessary. for methods==arrow functions no binding necessary (but there downsides probably).

Design Paradigm 
                        -------------pass state as prop-----> 
        Parent(stateful)                                      children(stateless)
                        <------------use method of parent----
       

Wait, where do I write my JS?

1. Remember we have class components and function components. We can write fn in the class body, sort of prototype. 

2. We can write fn inside the render method too. This is, either before the return value, or 
inside the HTML tags, not as pure JS but as JSX. The JS/JSX that we write here is usually more standard, for example, if else statements, declare variables. Example I sometimes use let name = this.state.name
which is just a way to avoid HTML/JSX cluttering later on.

3. Another important way we can run JS. And this in built-in methods. Those are also written in the class body: ComponentDidMount() etc etc. They run in specific times, and so the inner code is executed on those particular times, without being called.

