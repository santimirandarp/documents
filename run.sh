cd md        
sudo apt-get install pandoc
for directory in *; do
  echo "the directory is $directory\n\n"
  cd $directory/
  for file in *.md; do
    thename=$(basename $file .md)
    echo $thename
    pandoc $thename.md -o $thename.html
    done
   mv -iv *.html ../../html/$directory/
   cd ..
done
