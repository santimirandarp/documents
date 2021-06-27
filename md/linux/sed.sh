#!/bin/bash 

for file in "$@"
do sed -i $'s,</body>,<script src="../assets/js/index.js"></script></body>,g' "$file"
done
#do
 # isIndex=$(grep -F "index.css" ${file})
  #isHeader=$(grep -F "</header>" ${file})
 # if [ -n "$isIndex" ]; then   
  #  sed -i 's/href=.\.?\/?index\.css./href="..\/assets\/css\/index.css">/' $file
  #fi
 # done

#    continue
#  elif  [ -n "$isHeader" ]; then
#    sed -i 's/<\/header>/<link rel="stylesheet" href="..\/assets\/css\/index.css">\n\&/' $file
#    continue
#  else
#  sed -i 's/<html>/\&\n<header>\n<link rel="stylesheet" href="..\/assets\/css\/index.css">\n<\/header>/' $file

#in place replacement
# got a few options here for css.
# 1 there is an index.css with or without ./ before, that's one match to replace
# 2.there might not be and index css but only a header, then add <link....> inside
# 3.there might not be a header, then add <header>link</header> after <html>
#how to use sed
# sed 's/search/replace/'  --> use single quotes so the shell doesn't make any changes
# In the search slot $^.*/  be escaped or they will have a special meaning.
# in the replace slot only / is ambiguous and should be escaped. 
