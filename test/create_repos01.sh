# !/bin/bash
# This script creates a parent repository and a child repository with some commits.
# It is used as a test case
set -ue

# Reproducible repository: Set the names/dates in commits to a fixed value
export GIT_AUTHOR_NAME="Test User"
export GIT_AUTHOR_EMAIL="test@example.com"
export GIT_COMMITTER_NAME="Test User"
export GIT_COMMITTER_EMAIL="test@example.com"
export GIT_AUTHOR_DATE="1970-01-01 00:00:00 +0000"
export GIT_COMMITTER_DATE="1970-01-01 00:00:00 +0000"

git_init(){
    dir="$1"; shift
    git init "$dir" "$@"
    #git -C "$dir" config user.name "Test User"
    #git -C "$dir" config user.email "test@example.com"
}

git_init parent01
cd parent01

# Create and commit a file in the parent01 repository
echo "This is the parent01 repository" > parent01.txt
git add .
git commit -m "Initial commit in parent01 repository"

# Create the child directory
git_init child
git -C child commit --allow-empty -m "Initial commit in child repository"
git submodule add https://example.com/child child
git commit -m "Add child repository"

# Create and commit a file in the child repository
echo "This is the child repository" > child/child.txt
git -C child add child.txt
git -C child commit -m "Add file"

# Save submodule change in parent repo
git add . 
git commit -m "Add file in child repository"

# Create another file and commit in the child repository
echo "Second file in child repository" > child2.txt
git add child2.txt
git commit -m "Second commit in child repository"

cd .. # to initial working dir