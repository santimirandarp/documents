//fn declaration
function fn1(){
console.log("hey")
}
//fn expression
const fn2 = function(){
console.log("hey")
}
//fn expression with arrow notarion (arrow function)
const fn3 = ()=>{
console.log("hey")
} 
let p1 = new Promise(fn)
let p2 = new Promise(fn2)
let p3 = new Promise(fn3)
let p4 = new Promise(() => console.log("hey"))


function Bird(genre, specie, fn){
    this.genre=genre;
    this.specie=specie;
    this.fn = fn
}
let myBird = new Bird("xxx", "yyy", fn1)
let fn = fn1

myBird.fn()

p.resolve

