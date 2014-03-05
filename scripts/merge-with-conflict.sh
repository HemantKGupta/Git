# This script is to simulate a conflict when merge is being done.
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
echo"# After merge graph"
git log --graph --pretty=oneline --abbrev-commit
echo "# Checking out the master branch."
git checkout master
echo "Line 5 stuff" >> file.txt
echo "Line 6 stuff" >> file.txt
echo "Content of file.txt: "
cat file.txt
echo "# Committing file.txt in master."
git commit -a -m "Add line 5 and 6"
echo "# Checking out the alter branch."
git checkout alter
echo "# Output of show branch:"
git show-branch
echo "Line 5 alternate stuff" >> file.txt
echo "Line 6 alternate stuff" >> file.txt
echo "Content of file.txt: "
cat file.txt
git diff
echo "# Committing file.txt in alter."
git commit -a -m "Add alternate line 5 and 6"
echo "# Output of show branch:"
git show-branch
echo "# Checking out the master branch."
git checkout master
echo "# Merging the alter in master"
git merge alter
echo "# The diff is:"
git diff
