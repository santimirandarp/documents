let regex = {regex1:/hello/ , regex2:/hello/i , regex3:/hello/gi , regex4:/hell./gi , regex5:/hell[ou]|hellw/gi }


let theString = "hello, Hello, hEllo, hellw, hellu, hell"

for(let i = 1; i<6; i++){
    let result = theString.match(regex[`regex${i}`])
    console.log(result, `regex${i}`)
}


let allResults= {[
  'hello',
  index: 0,
  input: 'hello, Hello, hEllo, hellw, hellu, hell',
  groups: undefined
], "regex1"
[
  'hello',
  index: 0,
  input: 'hello, Hello, hEllo, hellw, hellu, hell',
  groups: undefined
] , "regex2"
[ 'hello', 'Hello', 'hEllo' ], "regex3"
[ 'hello', 'Hello', 'hEllo', 'hellw', 'hellu' ], "regex4"
[ 'hello', 'Hello', 'hEllo', 'hellu' ], "regex5"
}


//character set [sdgb] =  s|d|g|b will return match
//character class \d, \D, \W, \w
//special characters . + * ?
// quantity specifiers {} 
