#!/bin/bash
for directory in bash linux networks web;
do
	cd ./pages/$directory/
	for file in *.html; do
		thename=$(basename $file .html)
		echo $thename
		pandoc -o $thename.md $thename.html
	done
	mv -iv *.md ../../md/$directory/
	cd ../..
done
