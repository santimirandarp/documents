#!/bin/bash
#in place replacement
# got a few options here for css.
# 1 there is an index.css with or without ./ before, that's one match to replace
# 2.there might not be and index css but only a header, then add <link....> inside
# 3.there might not be a header, then add <header>link</header> after <html>
 for file in $@
  do
    cat $file | grep "index.css" && continue
      sed -i 's/href=\.*\/*index.css/href="..\/assets\/css\/index.css">&/' $file
    cat $file |  grep "</header>" && continue
   sed -i 's/<\/header>/<link rel="stylesheet" href="..\/assets\/css\/index.css">&/' $file
    cat $file | sed -i 's/<html>/&<header><link rel="stylesheet" href="..\/assets\/css\/index.css"><\/header>/' $file
  done



