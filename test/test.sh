# Main test script

thisdir="$(realpath "$(dirname "${BASH_SOURCE[0]}")")"
cd "$thisdir"

export GNUPGHOME=$(pwd)/gpg
# Set names and dates for annotated tags
export GIT_AUTHOR_NAME="Test User"
export GIT_AUTHOR_EMAIL="test@example.com"
export GIT_COMMITTER_NAME="Test User"
export GIT_COMMITTER_EMAIL="test@example.com"
export GIT_AUTHOR_DATE="1970-01-01 00:00:00 +0000"
export GIT_COMMITTER_DATE="1970-01-01 00:00:00 +0000"

bash create_gpg.sh

## Test fixture 1: Child repo nested within parent

#Set up test repository
bash create_repos01.sh
bash test_submoduletag
rm -rf parent01

## Test fixture 2: Child repo absorbed within parent .git/modules

bash create_repos01.sh
git -C parent01 submodule absorbgitdirs
bash test_submoduletag
