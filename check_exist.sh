#!/bin/bash

## check if any of the files we're symlinking in is present

echo The following files already exist...
for f in *; do [ -e ~/.$f ] && echo $f; done
