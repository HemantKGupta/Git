# This script is to understand the remote repositories in git. It is the first part.
# It assumes you have created a non bare repo in ~/public_html folder.

sudo rm -rf /tmp/Depot
echo "# Creating /tmp/Depot/ dir"
mkdir /tmp/Depot
cd /tmp/Depot
echo "# Creating clone of already existing ~/public_html repo."
git clone --bare ~/public_html public_html.git
echo "# changing direc to my public_html"
cd ~/public_html/
echo "# Output of listing"
ls -aF
echo "# Output of listing in .git"
ls -aF .git
echo "# Removing remote origin"
git remote rm origin
echo "# Switching to Depot"
cd /tmp/Depot/
echo "# Output of listing in .git"
ls -aF public_html.git
cd public_html.git
echo "# Config details"
cat config
echo "# changing direc to my public_html"
cd ~/public_html
echo "# Config details"
cat .git/config
git remote add origin /tmp/Depot/public_html
echo "New config"
cat .git/config
echo "# Before update branches:"
git branch -a
git remote update
echo "# After update branches:"
git branch -a
git show-branch -a
echo "# Creating the fuzzy.txt"
echo "Fuzzy Wuzzy was a bear" > fuzzy.txt
echo "Fuzzy Wuzzy had no hair" >> fuzzy.txt
echo "Fuzzy Wuzzy wasn't very fuzzy," >> fuzzy.txt
echo "Was he?" >> fuzzy.txt
echo "Content of fuzzy.txt:"
cat fuzzy.txt
echo "# Adding the fuzzy.txt in index"
git add fuzzy.txt
echo "# Committing the fuzzy.txt"
git commit -m "Added fuzzy.txt"
git show-branch -a
git push origin master
git show-branch -a
echo "# Switching to Depot"
cd /tmp/Depot/public_html.git
git show-branch
git ls-remote origin
