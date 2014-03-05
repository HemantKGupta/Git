#git reset adjusts the HEAD ref to a given commit and, by default, updates the index to match that commit. If desired, git reset can also
# modify your working directory to mirror the revision of your project represented by the given commit.
# The --soft changes the HEAD ref to point to the given commit. The contents of your index and working directory are left unchanged.
# --mixed changes HEAD to point to the given commit. Your index contents are also modified to the given commit. Working directory unchanged.
# --hard changes HEAD to point to the given commit. Your index contents and working directory contents are modified to the given commit
git init
echo "# Creating the master_file.txt"
echo "foo" > master_file.txt
echo "Content of master_file.txt:"
cat master_file.txt
echo "# Adding the master_file.txt in index"
git add master_file.txt
echo "# Committing the master_file.txt"
git commit -m "Added master_file.txt"


echo "# Updating the master_file.txt"
echo "more foo" >> master_file.txt
echo "Content of master_file.txt:"
cat master_file.txt
echo "# Adding the master_file.txt in index"
git add master_file.txt
echo "# Committing the master_file.txt"
git commit -m "Second commit of master_file.txt"
echo "# Output of show branch:"
git show-branch --more=5
echo "# Runing reset command: git reset HEAD^"
# --mixed is the default
git reset HEAD^
echo "# Output of show branch:"
git show-branch --more=5
echo "Content of master_file.txt:"
cat master_file.txt


echo "# Updating the master_file.txt"
echo "even more foo" >> master_file.txt
echo "Content of master_file.txt:"
cat master_file.txt
echo "# Adding the master_file.txt in index"
git add master_file.txt
echo "# Committing the master_file.txt"
git commit -m "Third commit of master_file.txt"
echo "# Output of show branch:"
git show-branch --more=5
echo "# Runing reset command: git reset --soft HEAD^"
git reset --soft HEAD^
echo "# Output of show branch:"
git show-branch --more=5
echo "Content of master_file.txt:"
cat master_file.txt
echo "# Committing the master_file.txt"
git commit -m "Forth commit of master_file.txt"
git reset --hard HEAD^
echo "# Output of show branch:"
git show-branch --more=5
echo "Content of master_file.txt:"
cat master_file.txt



