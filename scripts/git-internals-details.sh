# This script is to understand the internals of git.
#echo 'test content' | git hash-object -w --stdin
echo 'version 1' > test.txt
git hash-object -w test.txt
#83baae61804e65cc73a7201a7252750c76066a30
git cat-file -p 83baae61804e65cc73a7201a7252750c76066a30
git update-index --add --cacheinfo 100644 83baae61804e65cc73a7201a7252750c76066a30 test.txt
git write-tree
#d8329fc1cc938780ffdd9f94e0d364e0ea74f579
git cat-file -p d8329fc1cc938780ffdd9f94e0d364e0ea74f579
#100644 blob 83baae61804e65cc73a7201a7252750c76066a30      test.txt
echo 'new file' > new.txt
git update-index test.txt
git update-index --add new.txt
git write-tree
#5fda43a84182aa7329131e05a62cd6bb21b2feef
git cat-file -p 5fda43
100644 blob fa49b077972391ad58037050f2a75f74e3671e92	new.txt
100644 blob 83baae61804e65cc73a7201a7252750c76066a30	test.txt
git read-tree --prefix=bak d8329fc1cc938780ffdd9f94e0d364e0ea74f579
git write-tree
a36eb33603ffd88772ca3a8017a2f6ba814a3db0
echo 'first commit' | git commit-tree d8329f
3d9e435e74b54e3f41f64fe4349731c8739d0b90
echo 'second commit' | git commit-tree 5fda43a84 -p 3d9e435e
#5ed5a1e90c62c85a68a76b700cc84378d47ee54b
echo 'third commit'  | git commit-tree a36eb336 -p 5ed5a1e9
#b51f31a2d12c1d008dbcc65a0f7a6b80c11ed5b7
git log --stat b51f31a2

echo "b51f31a2d12c1d008dbcc65a0f7a6b80c11ed5b7" > .git/refs/heads/master
# above line should not be used, but use git update-ref refs/heads/master b51f31a2d12c1d008dbcc65a0f7a6b80c11ed5b7
git log --pretty=oneline  master
#b51f31a2d12c1d008dbcc65a0f7a6b80c11ed5b7 third commit
#5ed5a1e90c62c85a68a76b700cc84378d47ee54b second commit
#3d9e435e74b54e3f41f64fe4349731c8739d0b90 first commit
git update-ref refs/heads/test 5ed5a1e90
cat .git/HEAD
git checkout test
cat .git/HEAD
#ref: refs/heads/master
git symbolic-ref HEAD
#refs/heads/master
git update-ref refs/tags/v1.0 5ed5a1e90c62c85a68a76b700cc84378d47ee54b

