# This script is to simulate different kind of scenarios to understand git diff.
git init
echo "foo" > file1
echo "bar" > file2
git add file1 file2
git commit -m "Add file1 and file2"
echo "quux" > file1
# working directory versus index
git diff
# working directory versus HEAD
git diff HEAD
# index vs HEAD, identical still
git diff --cached
git add file1
git status
# working directory versus index
git diff
# working directory versus HEAD
git diff HEAD
# index vs HEAD
git diff --cached
$ echo "baz" > file1
# wd versus index
git diff
# wd versus HEAD
git diff HEAD
# index vs HEAD
git diff --cached
git commit -m "quux uber alles"
# Previous HEAD version versus current HEAD
git diff HEAD^ HEAD
