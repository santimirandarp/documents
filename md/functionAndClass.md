//preconceptions: there is no other way to write a method inside a constructor than
//to use the keyword this. But there is a shortcut for objects and class' body.
//its always a function expression, and preferably not an arrow function, or "this will be undefined".
```js
    class InsideConstructor{
        constructor(name){
            this.name = name
            this.namePlusName= function()ii{
            //function expression. arrows->error using "this"
            return this.name + this.name 
            } 
        }
    }
    let exampleInsideConstructor = new InsideConstructor("Example 1")
    exampleInsideConstructor.nameByTwo()

    //method inside class
    class InsideClass{
        constructor(name){
        this.name = name
        }
        namePlusName(){
         //function exp. shorthand.4 objects & class body, not constructor
            return this.name + this.name 
        }
    }
    let exampleInsideClass = new InsideClass("Example 2")
    exampleInsideClass.nameByTwo()

    //Method in the prototype   
    class InsidePrototype{
    constructor(name){
    this.name = name
    }
    }
   //if im not mistaken we can't define functions in class' prototype. only in constructors ptt.
    // for classes they are defined in the class' body. 

    let ExampleInPrototype = new InsidePrototype("Example 3")
    ExampleInPrototype.nameByTwo()
    console.log(ExampleInPrototype.constructor == InsidePrototype) //true
    
    //method inside prototype of a constructor Function
    function InsideFunctionPrototype(name){
    this.name = name
    }
    InsideFunctionPrototype.prototype = {
    constructor:InsideFunctionPrototype,
    nameByTwo(){
    return this.name + this.name 
    }
    }
    let ExampleInsideFunctionPrototype = new InsideFunctionPrototype(nam("Example 4")
    classInPrototype.nameByTwo()
    console.log(ExampleInsideConstructor, ExampleInsideClass, ExampleInsidePrototype, ExampleInsideFunctionPrototype)
```
# Conclusions
  1. Example 1 and 2 are equivalent in a sense, but in example 1 the method is created in every object 
  2.a Do not use arrow fn in prototype, the this is undefined.
  2.b Arrow functions do work with the this keyword inside the constructor (in a constructor function or 
    in a class constructor) but we create it every time we create a new object.
  4. We don't need to redefine constructor when using classes.
  5. Method in function prototype != method inside class prototype

## Main conclusion
Use functions inside body class, or in constructor function's prototype. Use Function expression (the shorthand).
A method inside a class, that will execute the 'this' keyword, should be written 
inside the class, and not in the class prototype.



Static (class-side) data properties and prototype data properties must be defined outside of the ClassBody declaration:

Rectangle.staticWidth = 20;
Rectangle.prototype.prototypeWidth = 25;
