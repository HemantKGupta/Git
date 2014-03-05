# This script is to understand the reset functionality of git.

git init
echo "# Creating the main.c"
echo "One line" > main.c
echo "# Adding the main.c in index"
git add main.c
echo "# Committing the main.c"
git commit -m "Initial commit with main.c file"
echo "# Creating the foo.c"
echo "Some line" > foo.c
echo "# Adding foo.c in index."
git add foo.c
echo "# Status:"
git status
echo "# Output of git ls-files"
git ls-files
echo "# Runing reset command: git reset HEAD foo.c "
git reset HEAD foo.c
echo "# Output of git ls-files"
git ls-files
