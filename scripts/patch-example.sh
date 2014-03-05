# This script is to understand the patch functionality of git.
git init
echo A > file.txt
git add file.txt
git commit -mA
echo B >> file.txt ; git commit -mB file.txt
echo C >> file.txt ; git commit -mC file.txt
echo D >> file.txt ; git commit -mD file.txt
echo "# Branch history is: "
git show-branch --more=4 master
echo "# Generating patch -1"
git format-patch -1
echo "# Generating patch -2"
git format-patch -2
echo "# Generating patch -3"
git format-patch -3
echo "# First patch is:"
cat 0001-C.patch
echo "# Checkout a new branch from master~2"
git checkout -b alter master~2
echo "# The log is:"
git log
echo "# Sending patch in email"
git send-email -to hemant.gupta@apnapaisa.com 0001-C.patch
echo "# log before applying patch"
git log
echo "# Apply patch to alter branch"
git am 0001-C.patch
echo "# log after applying patch"
git log


