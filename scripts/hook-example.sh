# This script is understand the hooks functionality of git. 
git init
# Put below script in .git/hooks/pre-commit file
#	#!/bin/bash
#	echo "Hello, I'm a pre-commit script!" >&2
#	if git diff --cached | grep '^\+' | grep -q 'broken'; then
#	echo "ERROR: Can't commit the word 'broken'" >&2
#	exit 1 # reject
#	fi
#	exit 0 # accept
# Give execute permission to script
chmod a+x .git/hooks/pre-commit
touch a b c
git add a b c
git commit -m 'added a, b, and c'
echo "perfectly fine" >a
echo "broken" >b
git commit -m "test commit -a" -a
