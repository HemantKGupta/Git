# This script is the second part of remote repository related tasks.
# It assumes you have a remote bare repo created in /tmp/Depot folder and
# also a local repo is present in the ~/public_html folder.
mkdir -p test/newDev
cd test/newDev
git clone /tmp/Depot/public_html.git
ls
cd public_html
ls
git branch
git log -1
git remote show origin
echo "# Updating the fuzzy.txt"
echo "No he isn't" >> fuzzy.txt
cat fuzzy.txt
echo "# Adding the fuzzy.txt in index"
git add fuzzy.txt
echo "# Committing the fuzzy.txt"
git commit -m "Updated fuzzy.txt"
git push
echo "# Done in newDev."


cd ~/public_html
git pull origin master
echo "Added a link" >> index.html
echo "# Adding the index.html in index"
git add index.html
echo "# Committing the index.html"
git commit -m "Updated index.html"
git push
echo "# Done in public_html."

cd ~/me/gitdemo/test/newDev/public_html
git pull origin master
