#!/bin/bash

FILENAME=$1
BASENAME=$(basename $1 .md)
marked ./md/${FILENAME}  -o ./html/$BASENAME.html
