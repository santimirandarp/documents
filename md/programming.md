## Programming

### Variables
```bash
string="my string"
array=("elements" *.txt "globs")
echo ${string} 
```
The `${}` is optional, but it's very useful if the string:

* has a `-` to avoid being confused with a command's flag.
* to avoid globbing (*), in case it contains a wildcard. 

${string} is better than $string, but sometimes it's just not necessary.

Normally variables are uppercase $STRING but it's not a requisite.

### Loops

```
for element in "${array[@]}"
do 
#comands here
done
```
A few useful bits:
"${array[@]}" makes element="${array[i]}" each time.
"${!array[@]}" makes element= array index each time.


### Switches

### Functions
