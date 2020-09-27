# Ways to create objects:
1. literal const obj = {}
2. normal functions
```
function example(name, surname){
let obj;
obj.name=name;
obj.surname=surname;
return obj
}
```
`const obj = example('mister', 'nobody')`

3. constructor functions
function Example(name, surname){
this.name=name;
this.surname=surname;
}
`const obj2 = new Example('mister', 'nobody')`

Next 2 create objects by copying a pre-existent one.

4. Object.create
```
let obj2=Object.create(obj) 
// obj located in obj2 prototype.!
```
5. Object.assign
```
Object.assign(target, source), ex Object.assign(obj2, obj1)
//If target already exists, it's overwritten.
```

`Person.prototype.fullName = this.name.first + ' ' + this.name.last;`
this won't work, because 'this' is refered to the global scope, not to the namespace.
It does runs fine with functions, but again, here 'this' refers to the namespace.
