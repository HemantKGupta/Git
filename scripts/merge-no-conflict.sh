# This script is to understand the merge functionality of git when there is no conflict.
echo "# Creating the empty repo."
git init
echo "# Creating file.txt."
echo "Line 1 stuff" > file.txt
echo "Line 2 stuff" >> file.txt
echo "Line 3 stuff" >> file.txt
echo "Content of file.txt: "
cat file.txt
echo "# Adding file.txt in index."
git add file.txt
echo "# Committing file.txt in master."
git commit -m "Initial 3 line file"
echo "# Creating other_file.txt."
echo "Here is stuff on another file!" > other_file.txt
echo "Content of other_file.txt: "
cat other_file.txt
echo "# Adding other_file.txt in index."
git add other_file.txt
echo "# Committing other_file.txt in master."
git commit -m "Another file"
echo "# Creating the alter branch and the checking out"
git checkout -b alter master^
echo "# Output of show branch:"
git show-branch
echo "# Adding a line in file.txt"
echo "Line 4 alternate stuff" >> file.txt
echo "# Adding file.txt in index and then committing in alter branch"
git commit -a -m "Add alternate's line 4"
echo "# Checking out the master branch."
git checkout master
echo "# The status is:"
git status
echo "# Merging the alter in master"
git merge alter
echo "# After merge graph"
git log --graph --pretty=oneline --abbrev-commit
