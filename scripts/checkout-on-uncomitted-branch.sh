# The script is to simulate the condition when there are uncomitted changes in index (staging are)
# and we want to checkout another branch. Git will allow this checkout with -m option and will
# create merge files with conflict data present in the file.

echo "# Creating empty repo. Command: git init"
git init
echo "# Creating file1.txt with content: Line 1"
echo "Line 1" > file1.txt
echo "# Adding file1.txt in master."
git add file1.txt
echo "# Committing file1.txt in master."
git commit -m "Added initial file1 in master"
echo "# Creating branch alter. Command: git branch alter"
git branch alter
echo "# Checking out branch alter. Command: git checkout alter"
git checkout alter
echo "# Updating file1.txt with content: Line 1 modified in alter"
echo "Line 1 modified in alter" > file1.txt
echo "# Adding file1.txt in alter."
git add file1.txt
echo "# Committing file1.txt in alter."
git commit -m "Modified file1 in alter"
echo "# Checking out branch master. Command: git checkout master"
git checkout master
echo "# Updating file1.txt with content: Line 1 modified in master"
echo "Line 1 is modified in master" > file1.txt
echo "# Checking out branch alter. Command: git checkout alter"
git checkout alter
echo "# the diff is as below:"
git diff alter
echo "# Checking out branch alter. Command: git checkout -m alter"
git checkout -m alter
echo "# See the content of file1.txt"
cat file1.txt
